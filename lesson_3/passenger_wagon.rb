# frozen_string_literal: true

require_relative 'wagon'

class PassengerWagon < Wagon
  def take_seat
    @occupied_place += 1 if occupied_place < free_place
    free_place
  end

  def type
    'passenger'
  end
end
