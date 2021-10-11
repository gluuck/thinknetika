require_relative 'wagon'

class PassengerWagon < Wagon
  attr_reader :occupied_seats, :free_seats, :type
 
  def take_seat
    @occupied_place += 1 if occupied_place < free_place
    free_place
  end

  def type
    'passenger'
  end
end
