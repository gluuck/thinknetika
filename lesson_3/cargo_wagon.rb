require_relative 'wagon'

class CargoWagon < Wagon
  attr_reader :occupied_place, :type, :volume 

  def volume(volume)
    @occupied_place += volume  if occupied_place < free_place
    free_place
  end

  def type
    'cargo'
  end
end
