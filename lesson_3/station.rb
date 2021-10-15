# frozen_string_literal: true

require_relative 'instance_counter'
require_relative 'validator'

class Station
  include InstanceCounter
  include Validation

  attr_reader :name, :trains
  validate :name, :type, String
  validate :name, :presence

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
    trains << train
  end

  def trains_by_type(type)
    trains.select { |train| train.type == type }
  end

  def remove_train(train)
    trains.delete(train)
  end

  def block_trains
    trains.collect(&block) if block_given?
  end
end
