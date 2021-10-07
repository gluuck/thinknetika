require_relative 'manufacturer'
require_relative 'instance_counter'
require_relative 'validator'

class Train
  attr_accessor :speed, :number
  attr_reader :type, :current_station_index, :wagons

  include Manufacturer
  include InstanceCounter
  include ValidTrain
  include Validator

  @@trains = []

  qty_instance
  
  def initialize(number, type)
    @number = number
    @type = type
    @speed = 0
    @wagons = []
    @current_station_index = 0
    @@trains.push(self)
    register_instance
    validate!
  end

  def self.find(number=nil)
    @@trains.detect{|train| train.number == number}
  end

  def pick_up_speed(value)
    self.speed += value if value >= 0
  end

  def stop_train
    self.speed = 0
  end

  def add_wagon(wagon)
    @wagons.push(wagon) if self.type == wagon.type && self.speed.zero?
  end

  def remove_wagon(wagon)
    @wagons.delete(wagon) if @wagons.include?(wagon) && self.speed.zero?
  end

  def take_a_route(route)
    @current_route = route
    @current_station = route.stations.first
    @current_station.add_train(self)
  end

  def next_station
    @current_station = @current_route.stations[@current_station_index += 1]
  end

  def previos_station
    @current_station = @current_route.stations[@current_station_index -= 1] if @current_route.stations.size.positive?
  end

  def move_forward
    @current_station.remove_train(self)
    next_station
    @current_station.add_train(self)
  end

  def move_back
    @current_station.remove_train(self)
    previos_station
    @current_station.add_train(self)
  end

  def block_of_wagons
    wagons.collect(&block) if block_given?
  end
end
