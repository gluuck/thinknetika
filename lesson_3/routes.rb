class Route
  attr_accessor :stations

  def initialize(fist_station, last_station)
    @stations = [fist_station, last_station]
  end

  def add_station(station)
    @stations.insert(-2,station)
  end

  def delete_station(index)
    @stations.slice!(index)
  end
end
