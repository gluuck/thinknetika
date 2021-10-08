module InstanceCounter

  def self.included(mixin)
    mixin.extend Counter
  end

  module Counter
    attr_accessor :instances

    private

    def qty_instance
      @instances ||= 0
    end
  end

  private

  def register_instance
    self.class.instances += 1
  end
end
