require_relative 'instance_counter'

class Station
  attr_reader :name, :trains
 
  include InstanceCounter
  
  @@stations = []

  qty_instance

  def self.all
    @@stations
  end

  def initialize(name)
    @name = name
    @trains = []
    @@stations.push(self)
    register_instance
  end

  def add_train(train)
    @trains << train
  end

  def trains_by_type(type)
    @trains.select{|train| train.type == type}
  end

  def remove_train(train)
    @trains.delete(train)
  end
end
