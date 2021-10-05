require_relative 'station'
require_relative 'passenger_train'
require_relative 'cargo_train'
require_relative 'route'
require_relative 'passenger_wagon'
require_relative 'cargo_wagon'
require_relative 'validator'

class Railway
  attr_reader :stations, :trains, :routes, :wagons

  def initialize
    @stations = []
    @trains = []
    @routes = []
    @wagons = []
  end

  def new_station
    name = gets.chomp.downcase
    stations << Station.new(name)
  end

  def new_train
    number = gets.chomp.downcase
    type = gets.chomp.downcase
    case type
    when 'cargo'
      trains << CargoTrain.new(number, type)
    when 'passenger'
      trains << PassengerTrain.new(number, type)
    end
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
    p stations
  end

  def list_trains
    p trains
  end
end

railway = Railway.new


# loop do
#   puts 'Choose your variant : "create station","create train", "create route", "add station",
#        "remove station", "get route", "add wagon(index_train)", "remove wagon(index_train,index_wagon)", "move forward",
#        "move back", "show stations" , "show trains"'
#   #p railway
#
#   action = gets.chomp.downcase
#
#   case action
#   when 'create station' then p railway.new_station
#   when 'create train'   then p railway.new_train
#   when 'create route'   then p railway.new_route
#   when 'add station'    then p railway.add_station
#   when 'remove station' then p railway.remove_station
#   when 'get route'      then railway.get_route
#   when 'add wagon'      then railway.add_wagon
#   when 'remove wagon'   then railway.remove_wagon
#   when 'move forward'   then railway.move_forward
#   when 'move back'      then railway.move_back
#   when 'show stations'  then railway.list_stations
#   when 'show trains'    then railway.list_trains
#   else
#
#   end
#   p action
# end
