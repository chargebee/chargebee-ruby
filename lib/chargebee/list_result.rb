require 'forwardable'

module ChargeBee
  class ListResult 
    extend Forwardable
    include Enumerable
    
    def_delegator :@list, :each, :each
    def_delegator :@list, :length, :length
    
    attr_reader :next_offset

    def initialize(response, next_offset=nil, rheaders = nil)
      @response = response
      @rheaders = rheaders
      @list = Array.new
      @next_offset = JSON.parse(next_offset).to_s if next_offset
      initItems()
    end

    def get_response_headers()
      @rheaders
    end

    def get_raw_response()
      @response
    end

    private
    def initItems()
      @response.each do |item|
        @list.push(Result.new(item))
      end
    end
  
  end
end
