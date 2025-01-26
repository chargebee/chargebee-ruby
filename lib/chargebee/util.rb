module ChargeBee
  module Util
    def self.serialize(value, prefix = nil)
      serialized = {}
      case value
      when Hash
        value.each do |k, v|
          if %i[metadata meta_data].include?(k) # metadata is encoded as a JSON string instead of URL-encoded.
            serialized.merge!({ k.to_s => as_str(v) })
          elsif v.is_a? Hash or v.is_a? Array
            new_k = prefix.nil? ? k.to_s : prefix + "[#{k}]"
            serialized.merge!(serialize(v, new_k))
          else
            new_k = prefix.nil? ? k.to_s : prefix + "[#{k}]"
            serialized.merge!({ new_k => as_str(v) })
          end
        end
      when Array
        value.each_with_index do |v, i|
          new_k = prefix.to_s + "[#{i}]"
          serialized.merge!(serialize(v, new_k))
        end
      else
        raise ArgumentError.new('only hash or arrays are allowed as value') if prefix.nil?

        serialized.merge!({ prefix => as_str(value) })
      end
      serialized
    end

    def self.symbolize_keys(object)
      case object
      when Hash
        new = {}
        object.each do |key, value|
          key = begin
            key.to_sym
          rescue StandardError
            key
          end || key
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
      if value.nil?
        ''
      else
        value.to_s
      end
    end
  end
end
