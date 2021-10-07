require_relative 'wagon'

class CargoWagon < Wagon
  attr_accessor :wagon_volume, :occupied_volume, :free_volume, :type

  def initialize(wagon_volume)
    super(self.type)
    @wagon_volume = wagon_volume
    @occupied_volume = nil
  end

  def volume(volume)
    occupied_volume + volume if occupied_volume < wagon_volume
  end

  def free_volume
    @free_volume = wagon_volume - occupied_volume
  end

  def type
    'cargo'
  end
end
