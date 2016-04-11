require 'uri'

module ChargeBee
  class Model
    
    def initialize(values, sub_types={}, dependant_types={})
      @values = values
      @sub_types = sub_types
      @dependant_types = dependant_types
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
          when Hash && (@dependant_types[k] != nil)
            next
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
      elsif(m[0,3] == "cf_") # All the custom fields start with prefix cf_. 
          return nil
      end
      puts "There's no method called #{m} #{args} here -- please try again."
      puts @values
    end
    
    def self.uri_path(*paths) 
      url = ""
      for path in paths
          if(path.nil? || path.strip.length < 1) 
             raise "Id is empty or nil" 
          end
          url = "#{url}/#{URI.encode(path.strip)}"
      end
      return url
    end
    
    def self.construct(values, sub_types = {}, dependant_types = {})
      if(values != nil)
        obj = self.new(values, sub_types, dependant_types)
        obj.load(values)
        obj
      end
    end
    
    def init_dependant(obj, type, sub_types = {})
      instance_eval do
        if(obj[type] != nil)
          case obj
          when Hash
            if(@dependant_types[type] != nil)
              dependant_obj = @dependant_types[type].construct(obj[type], sub_types)
              instance_variable_set("@#{type}", dependant_obj)
            end
          end
        end
      end
    end
    
    def init_dependant_list(obj, type, sub_types = {})
      instance_eval do
        if(obj[type] != nil)
          case obj[type]
          when Array
            if(@dependant_types[type] != nil)
              set_val = obj[type].map {|dt| @dependant_types[type].construct(dt, sub_types)}
              instance_variable_set("@#{type}", set_val)
            end
          end
        end
      end
    end
    
  end
end
