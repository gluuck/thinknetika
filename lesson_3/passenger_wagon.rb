require_relative 'wagon'

class PassengerWagon < Wagon
  attr_reader :number_of_seats, :occupied_seats, :free_seats, :type

  def initialize(number_of_seats)
    super(self.type)
    @number_of_seats = number_of_seats
  end

  def take_seat
    @occupied_seats ||= 0
    @occupied_seats += 1 if @occupied_seats < @number_of_seats
    free_seats
  end

  def free_seats
    @free_seats = @number_of_seats - @occupied_seats
  end

  def type
    'passenger'
  end
end
