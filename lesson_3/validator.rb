module ValidTrain

  NUM = /[\w]{3}-?[\w]{2}/i

  def validate!
    raise 'Number must have XXX-XX or XXXXX characters' if self.number !~ NUM
    raise 'Type must be cargo or passenger' unless ['cargo','passenger'].include? self.type 
  end  
end

module ValidRoute
  
  def validate!
    raise 'Element must be type Station' unless self.stations.map {|x| x.is_a? Station}.first && self.stations.map {|x| x.is_a? Station}.last
  end
end

module ValidStation
  NAME = /[\w]+/
  def validate!
    raise 'Cant be empty'  if self.name !~ NAME
  end
end

module Validator
  def valid?
    validate!
  rescue
    false    
  end
end
