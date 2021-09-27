require_relative 'station'
require_relative 'passenger_train'
require_relative 'cargo_train'
require_relative 'route'
require_relative 'passenger_wagon'
require_relative 'cargo_wagon'

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
    @stations << Station.new(name)
  end

  def new_train
    number = gets.to_i
    type = gets.chomp.downcase
    case type
    when 'cargo'
      @trains << CargoTrain.new(number, type)
    when 'passenger'
      @trains << PassengerTrain.new(number, type)
    else
      puts 'Can`t create a train'
    end
  end

  def new_route
    @routes << Route.new(@stations.first, @stations.last)
  end

  def add_station(index_route,index_station)
    @routes[index_route].add_station(@stations[index_station])
  end

  def remove_station(index_route,index_station)
    @routes[index_route].delete_station(@stations[index_station])
  end

  def get_route(index_train,index_route)
    @trains[index_train].take_a_route(@routes[index_route])
  end
  
  def add_wagon(index_train)
    @trains[index_train].add_wagon(CargoWagon.new) if @trains[index_train].type == 'cargo'
    @trains[index_train].add_wagon(PassengerWagon.new) if @trains[index_train].type == 'passenger'
  end

  def remove_wagon(index_train, index_wagon)
    @trains[index_train].remove_wagon(@trains[index_train].wagons[index_wagon])
  end

  def move_forward(index_train)
    @trains[index_train].move_forward    
  end

  def move_back(index_train)
    @trains[index_train].move_back
  end

  def list_stations
    p @stations.map(&:name).join(' ')
  end

  def list_trains
    p @trains.map(&:number).join(' ')
  end
end 

railway = Railway.new


loop do
  puts 'Choose your variant : "create station","create train", "create route", "add station",
       "remove station", "get route to train", "add wagon", "remove wagon", "move forward",
       "move back", "show stations" , "show trains"'

  action = gets.chomp.downcase

  case action
  when 'create station' then railway.new_station
  when 'create train'   then railway.new_train
  when 'create route'   then railway.new_route
  when 'add station'    then railway.add_station
  when 'remove station' then railway.remove_station
  when 'get route'      then railway.get_route
  when 'add wagon'      then railway.add_wagon
  when 'remove wagon'   then railway.remove_wagon
  when 'move forward'   then railway.move_forward
  when 'move back'      then railway.move_back
  when 'show stations'  then railway.list_stations
  when 'show trains'    then railway.list_trains
  else
    break
  end
end