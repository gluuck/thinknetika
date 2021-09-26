class Train  
  attr_accessor :speed
  attr_reader :number, :type, :current_station_index, :wagons

  def initialize(number, type)
    @number = number
    @type = type
    @speed = 0
    @wagons = []
  end  

  def pick_up_speed(value)
    self.speed += value if value >= 0
  end

  def stop_train
    self.speed = 0
  end

  def add_wagon(wagon)
    @wagons.push(wagon) if self.speed.zero?
  end

  def remove_wagon(wagon)
    @wagons.pop if @wagons.include?(wagon) && self.speed.zero?
  end

  def take_a_route(route)
    @current_route = route
  end
  
  def next_station
    @current_station = @current_route.stations[@current_station_index + 1]
  end

  def previos_station 
    @current_station = @current_route.stations[@current_station_index - 1] if @current_route.stations.size > 0
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
end
