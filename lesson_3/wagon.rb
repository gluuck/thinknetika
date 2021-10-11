require_relative 'manufacturer'

class Wagon
  attr_accessor :type, :number_wagon, :total_place, :occupied_place, :free_place

  include Manufacturer
  @@wagons = []

  def initialize(total_place)
    @total_place = total_place
    @number_wagon = 0
    @@wagons.push(self)
    @@wagons.size.times do
      @number_wagon +=1
    end
    @occupied_place = 0
  end

  def free_place
    @free_place = total_place  - occupied_place
  end

  def self.all
    @@wagons
  end
end
