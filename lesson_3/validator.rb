# frozen_string_literal: true

module ValidTrain
  NUM = /\w{3}-?\w{2}/i.freeze

  def validate!
    raise 'Number must have XXX-XX or XXXXX characters' if number !~ NUM
    raise 'Type must be cargo or passenger' unless %w[cargo passenger].include? type
  end
end

module ValidRoute
  def validate!
    raise 'Element must be type Station' unless stations.map { |x| x.is_a? Station }.first && stations.map do |x|
                                                  x.is_a? Station
                                         end.last
  end
end

module ValidStation
  NAME = /\w+/.freeze
  def validate!
    raise 'Cant be empty'  if name !~ NAME
  end
end

module Validator
  def valid?
    validate!
  rescue StandardError
    false
  end
end
