require_relative 'wagon'

class PassengerWagon < Wagon
  attr_accessor :number_of_seats, :seats, :free_seats, :type

  def initialize(number_of_seats)
    super(self.type)
    @number_of_seats = number_of_seats
    @seats = 0
  end

  def take_seat
    seats += 1 if seats < number_of_seats
  end

  def free_seats
    @free_seats = number_of_seats - seats
  end

  def type
    'passenger'
  end
end
