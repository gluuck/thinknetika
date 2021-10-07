require_relative 'station'
require_relative 'passenger_train'
require_relative 'cargo_train'
require_relative 'route'
require_relative 'passenger_wagon'
require_relative 'cargo_wagon'
require_relative 'validator'
require_relative 'seed'

class Railway
  attr_reader :stations, :trains, :routes, :wagons

  def initialize
    @stations = []
    @trains = []
    @routes = []
    @wagons = []
  end

  def new_station
    Station.all.each{|station| stations << station}
  end

  def new_train
    Train.all.each{|train| trains << train}
  end

  def new_route
    routes << Route.new(stations.first, stations.last)
  end

  def add_station(index_route,index_station)
    routes.fetch(index_route).add_station(stations.fetch(index_station))
  end

  def remove_station(index_route,index_station)
    routes.fetch(index_route).delete_station(stations.fetch(index_station))
  end

  def get_route(index_train,index_route)
    trains.fetch(index_train).take_a_route(routes.fetch(index_route))
  end

  def add_wagon(index_train,index)
    wagon = [CargoWagon.new].fetch(index, PassengerWagon.new)
    trains.fetch(index_train).add_wagon(wagon)
  end

  def remove_wagon(index_train, index_wagon)
    trains.fetch(index_train).remove_wagon(trains.fetch(index_train).wagons.fetch(index_wagon))
  end

  def move_forward(index_train)
    trains.fetch(index_train).move_forward
  end

  def move_back(index_train)
    trains.fetch(index_train).move_back
  end

  def list_stations
    stations
  end

  def list_trains
    trains
  end


end
