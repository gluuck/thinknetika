require_relative 'instance_counter'

class Route
  attr_reader :stations

  extend InstanceCounter::Counter

  @@routes = []
  
  def initialize(fist_station, last_station)
    @stations = [fist_station, last_station]
    @@routes.push(self)
    Route.register_instance
  end

  def add_station(station)
    @stations.insert(-2,station)
  end

  def delete_station(station)
    @stations.delete(station)
  end
end
