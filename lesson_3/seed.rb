# frozen_string_literal: true

require 'faker'
require_relative 'station'
require_relative 'passenger_train'
require_relative 'cargo_train'
require_relative 'route'
require_relative 'passenger_wagon'
require_relative 'cargo_wagon'
require_relative 'validator'
require_relative 'train'

10.times do
  Station.new(Faker::Name.first_name)
end

10.times do
  number = Faker::Lorem.characters(number: 5)
  type = %w[cargo passenger]
  CargoTrain.new#(number, type[0])
  PassengerTrain.new#(number, type[1])
end

10.times do
  CargoWagon.new(Faker::Number.number(digits: 2))
  PassengerWagon.new(Faker::Number.number(digits: 2))
end
