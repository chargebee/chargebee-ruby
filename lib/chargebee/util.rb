module ChargeBee
  module Util
    
    def self.serialize(value, prefix = nil, idx = nil)
      serialized = {}
      case value
        when Hash
          value.each do |k, v|
            if(v.instance_of? Hash or v.instance_of? Array)
              serialized.merge!(serialize(v, k))
            else
              key = "#{(prefix!=nil) ? prefix:''}#{(prefix!=nil) ? '['+k.to_s+']' : k}#{(idx != nil) ? '['+idx.to_s+']':''}"
              serialized.merge!({key => (v!=nil)?v:''})
            end
          end
        when Array
          value.each_with_index do |v, i|
            serialized.merge!(serialize(v, prefix, i))
          end
        else
          raise ArgumentError.new("only hash or arrays are allowed as value")
      end
      serialized
    end
    
    def self.symbolize_keys(object)
      case object
      when Hash
        new = {}
        object.each do |key, value|
          key = (key.to_sym rescue key) || key
          new[key] = symbolize_keys(value)
        end
        new
      when Array
        object.map { |value| symbolize_keys(value) }
      else
        object
      end
    end
    
  end
end
