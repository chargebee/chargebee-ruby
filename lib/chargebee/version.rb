module ChargeBee
  module Version
    
    VERSION = '1.0.0'

    class << self
      def inspect
        VERSION.dup
      end
      alias to_s inspect
    end
  end
end
