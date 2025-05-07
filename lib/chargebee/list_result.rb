require 'forwardable'

module ChargeBee
  class ListResult
    extend Forwardable
    include Enumerable

    def_delegator :@list, :each, :each
    def_delegator :@list, :length, :length

    attr_reader :next_offset

    def initialize(response, next_offset=nil, rheaders = nil, http_status_code=nil)
      @response = response
      @rheaders = rheaders
      @http_status_code = http_status_code
      @list = Array.new
      if next_offset
        begin
          @next_offset = JSON.parse(next_offset).to_s
        rescue JSON::ParserError
          @next_offset = next_offset.to_s
        end
      end
      initItems()
    end

    def get_response_headers()
      @rheaders
    end

    def get_raw_response()
      @response
    end
    def get_http_status_code()
      @http_status_code
    end

    private
    def initItems()
      @response.each do |item|
        @list.push(Result.new(item))
      end
    end

  end
end
