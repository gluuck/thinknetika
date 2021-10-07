require_relative 'manufacturer'

class Wagon
  attr_reader :type

  include Manufacturer
  @@wagons = []
  def initialize(type)
    @type = type   
    @@wagons.push(self)
  end

  def self.all
    @@wagons
  end
end
