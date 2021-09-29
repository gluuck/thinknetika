module InstanceCounter
  
  def self.instances
    @instances
  end

  private

  def register_instance
    @instances ||= 0
    @instances += 1
  end
end
