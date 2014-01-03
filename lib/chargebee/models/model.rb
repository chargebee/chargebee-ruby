module ChargeBee
  class Model
    
    def initialize(values, sub_types={})
      @values = values
      @sub_types = sub_types
    end
    
    def to_s(*args) 
      JSON.pretty_generate(@values) 
    end
    
    def inspect()
      "#<#{self.class}:0x#{self.object_id.to_s(16)} > JSON: " + JSON.pretty_generate(@values)
    end
    
    def load(values)
      instance_eval do
        values.each do |k, v|
          set_val = nil
          case v
          when Hash
            set_val = (@sub_types[k] != nil) ? @sub_types[k].construct(v) : v
          when Array
            if(@sub_types[k] != nil)
              set_val = v.map { |item| @sub_types[k].construct(item)}
            else
              set_val = v
            end
          else
            set_val = v
          end
          instance_variable_set("@#{k}", set_val)
        end
      end
    end
    
    def method_missing(m, *args, &block)
      if(@values.has_key?(m))
          return @values[m]
      end
      puts "There's no method called #{m} #{args} here -- please try again."
      puts @values
    end
    
    def self.construct(values, sub_types = {})
      if(values != nil)
        obj = self.new(values, sub_types)
        obj.load(values)
        obj
      end
    end
    
  end
end