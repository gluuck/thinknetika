class Train  
  attr_accessor :speed
  attr_reader :number, :type, :current_station, :wagons

  def initialize(number, type)
    @number = number
    @type = type
    @speed = 0
    @wagons = []
  end

  def take_a_route(route)
    @current_station_route = route
    @current_station = @current_station_route.stations.first
    @curent_station.add_train(self)
  end
  
  def next_station
    @current_station = @current_station_route.stations[@current_station_route.stations.index(@current_station) +1 ]
  end

  def previos_station 
    if @curent_station != @current_station_route.stations.first
      @curent_station = @current_station_route.stations[@current_station_route.stations.index(@current_station) -1 ]
    end
  end

  def move_forward
    next_station
    @current_station.add_train(self)
  end

  def move_back
    @current_station.remove_train(self)
  end

# не даем пользователю менять колличество вагонов  и скорость

  protected

  def pick_up_speed(value)
    self.speed += value if value >= 0
  end

  def stop_train
    self.speed = 0
  end

  def add_wagon(wagon, train)
    @wagons.push(wagon) if wagon.type == train.type && self.speed.zero?
  end

  def remove_wagon
    @number_wagons -= 1 if self.speed.zero?
  end
end
