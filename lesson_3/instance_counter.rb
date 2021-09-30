module InstanceCounter

  module Counter
      def instances
        @instances
      end

      def register_instance
        @instances ||= 0
        @instances += 1
      end    
  end  
end
