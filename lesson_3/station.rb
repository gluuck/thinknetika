class Station
  attr_reader :name
  attr_accessor :list_trains

def initialize(name)
  @name = name
  @list_trains = []
end

def add_train(train)
  @list_trains << train
end

def list_trains
  @list_trains.each {|name| puts name} 
end

def trains_type(train_type)
  @list_trains.select{|type| type == train_type}.count
end

def remove_train
  @list_trains.shift
end
end
