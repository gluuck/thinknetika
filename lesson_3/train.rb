class Train  
  attr_accessor :speed
  attr_reader  :number_of_train,:type_of_train,:num_wagons, :current_station  

  def initialize(number_of_train,type_of_train,num_wagons)    
    @number_of_train = number_of_train
    @type_of_train = type_of_train
    @num_wagons = num_wagons
    @speed = 0
  end

  def pick_up_speed(speed)
    @speed += speed if @speed >= 0
  end

  def stop_train
    @speed = 0
  end

  def change_wagons
    if @speed.zero?
      @num_wagons += 1 if @num_wagons < 20
      @num_wagons -= 1 if @num_wagons > 20
    else
      p 'Can`t change number'
    end
  end

  def take_a_route(route)
    @current_station_route = route
    @current_station = @current_station_route.stations.first
    @curent_station.add_train
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
    @current_station.add_train
  end

  def move_back
      @current_station.remove_train
  end
end
