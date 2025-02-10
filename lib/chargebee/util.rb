module ChargeBee
  module Util

    def self.serialize(value, prefix = nil, idx = nil, json_keys = nil, level = 0)
      serialized = {}
      case value
        when Hash
          value.each do |k, v|
            should_json_encode = json_keys[k] && json_keys[k] == level
            if should_json_encode
              key = "#{prefix || ''}#{prefix ? "[#{k}]" : k}#{idx ? "[#{idx}]" : ''}"
              serialized.merge!({key.to_s => v.to_json})
            elsif(v.kind_of? Hash or v.kind_of? Array)
              temp_prefix = prefix!=nil ? "#{prefix}[#{k}]" : k
              serialized.merge!(serialize(v, temp_prefix, nil , json_keys, level+1))
            else
              key = "#{(prefix!=nil) ? prefix:''}#{(prefix!=nil) ? '['+k.to_s+']' : k}#{(idx != nil) ? '['+idx.to_s+']':''}"
              serialized.merge!({key => as_str(v)})
            end
          end
        when Array
          value.each_with_index do |v, i|
            serialized.merge!(serialize(v, prefix, i, json_keys, level))
          end
      else
           if(idx != nil and prefix != nil)
              key = "#{prefix}[#{idx.to_s}]"
              serialized.merge!({key => as_str(value)})
           else
             raise ArgumentError.new("only hash or arrays are allowed as value")
           end
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

    def self.as_str(value)
      if(value == nil)
        return ''
      else
        return value.to_s
      end
    end

  end
end
