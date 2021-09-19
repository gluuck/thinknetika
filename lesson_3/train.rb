require_relative 'route'

class Train  
  
  def initialize(number_of_train,type_of_train,num_wagons)    
    @number_of_train = number_of_train
    @type_of_train = type_of_train
    @num_wagons = num_wagons
    @speed = 0
  end

  def pick_up_speed(speed)
    @speed += speed if @speed >= 0
  end

  def speed
    @speed
  end

  def stop_train
    @speed = 0
  end

  def num_wagons
    @num_wagons
  end

  def change_wagons
    if @speed == 0

      if @num_wagons < 20
        @num_wagons += 1 

      elsif @num_wagons > 20
        @num_wagons -= 1
      end 

    else
      p 'Can`t change number'    
    end    
  end

  def take_a_route(route)
    @current_station_routes = route
  end

  
end
