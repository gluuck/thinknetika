class Station
  attr_reader :name
  attr_accessor :trains

  def initialize(name)
    @name = name
    @trains = []
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
