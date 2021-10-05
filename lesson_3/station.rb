require_relative 'instance_counter'
require_relative 'validator'

class Station
  attr_reader :name, :trains
 
  include InstanceCounter
  include ValidStation
  include Validator

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
    validate!
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
