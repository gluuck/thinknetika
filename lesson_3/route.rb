class Route
  attr_reader :stations

  def initialize(fist_station, last_station)
    @stations = [fist_station, last_station]
  end

  def add_station(station)
    @stations.insert(-2,station)
  end

  def delete_station(station)
    @stations.delete(station)
  end
end