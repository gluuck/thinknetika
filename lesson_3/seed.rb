 
require 'faker'
require_relative 'station'
require_relative 'passenger_train'
require_relative 'cargo_train'
require_relative 'route'
require_relative 'passenger_wagon'
require_relative 'cargo_wagon'
require_relative 'validator'

def seed_stations
	10.times do
	  Station.new(Faker::Name.first_name)
	end  
end

def seed_trains
	10.times do
	  number = Faker::IDNumber.spanish_citizen_number
	  type = ['cargo', 'passenger']      
	  CargoTrain.new(number, type[0])      
	  PassengerTrain.new(number, type[1])
	end
end

def seed_wagons
	10.times do
	CargoWagon.new(Faker::Number.number(digits: 2))
	PassengerWagon.new(Faker::Number.number(digits: 2))
end
end


seed_stations
seed_trains
seed_wagons
