# frozen_string_literal: true

require_relative 'wagon'

class CargoWagon < Wagon
  def volume(volume)
    @occupied_place += volume if occupied_place < free_place
    free_place
  end

  def type
    'cargo'
  end
end
