require_relative 'instance_counter'
require_relative 'validator'
require_relative 'station'

class Route
  attr_reader :stations

  include InstanceCounter
  include ValidRoute
  include Validator
  
  qty_instance

  def initialize(fist_station, last_station)
    @stations = [fist_station, last_station]
    validate!
    register_instance
  end

  def add_station(station)
    @stations.insert(-2,station)
  end

  def delete_station(station)
    @stations.delete(station)
  end
end
