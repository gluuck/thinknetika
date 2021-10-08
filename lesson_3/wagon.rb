require_relative 'manufacturer'

class Wagon
  attr_accessor :type, :number_wagon

  include Manufacturer
  @@wagons = []

  def initialize(type)
    @type = type
    @number_wagon = 0
    @@wagons.push(self)
    @@wagons.size.times do
      @number_wagon +=1
    end
  end

  def self.all
    @@wagons
  end
end
