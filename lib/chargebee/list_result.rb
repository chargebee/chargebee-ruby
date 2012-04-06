require 'forwardable'

module ChargeBee
  class ListResult 
    extend Forwardable
    include Enumerable
    
    def_delegator :@list, :each, :each
    def_delegator :@list, :length, :length
    
    def initialize(response)
      @response = response
      @list = Array.new
      initItems()
    end
    
    private
    def initItems()
      @response.each do |item|
        @list.push(Result.new(item))
      end
    end
  
  end
end
