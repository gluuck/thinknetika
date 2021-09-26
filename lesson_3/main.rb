require_relative 'station'
require_relative 'passenger_train'
require_relative 'cargo_train'
require_relative 'route'
require_relative 'passenger_wagon'
require_relative 'cargo_wagon'

class Railway
   attr_reader :stations, :trains, :routes, :wagons


  puts 'You can create stations , trains, routes and stations in there ,get a route to train,
        add wagons to train, remove wagons of train ,view the list of stations 
        and the list of trains at the station'

  puts 'Choose your variant : "create station","create train", "create route", "add station",
        "remove station from route", "get route to train", "add wagon", "remove wagon", "move forward",
        "move back", "show stations" , "show trains"'   

  #action = gets.chomp.downcase
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
      @trains << CargoTrain.new(number,type)
    when 'passenger'
      @trains << PassengerTrain.new(number,type)
    else
      puts 'Can`t create a train'
    end   
  end

  def new_route
    @routes << Route.new(@stations.first.name,@stations.last.name)
  end

  def add_station(index_route,index_station)
    @routes[index_route].add_station(@stations[index_station].name)
  end

  def remove_station(index_route,index_station)
    @routes[index_route].delete_station("#{@stations[index_station].name}")
  end

  def get_route(index_train,index_route)
    @trains[index_train].take_a_route(@routes[index_route])
  end
  
  def add_wagon(index_train)
    @trains[index_train].add_wagon(CargoWagon.new) if @trains[index_train].type == 'cargo'
    @trains[index_train].add_wagon(PassengerWagon.new) if @trains[index_train].type == 'passenger'
  end

  def remove_wagon
    super
  end

  def method_name
    
  end
end 
