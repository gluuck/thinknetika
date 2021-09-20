class Train  
  attr_accessor :speed
  attr_reader  :number, :type, :num_wagons, :current_station  

  def initialize(number_of_train,type_of_train,num_wagons)    
    @number = number_of_train
    @type = type_of_train
    @num_wagons = num_wagons
    @speed = 0
  end

  def pick_up_speed(value)
    self.speed += value if value >= 0
  end

  def stop_train
    self.speed = 0
  end

  def add_wagon    
    @num_wagons += 1 if self.speed.zero?
  end   

  def remove_wagon
    @num_wagons -= 1 if self.speed.zero?    
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
end
