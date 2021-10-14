module Acсessors
  def attr_accessor_with_history(*attributes)
    attributes.each do |attribute|
      instance_var = "@#{attribute}".to_sym
      history_name = "@#{attribute}_history".to_sym
      define_method(attribute) { instance_variable_get(instance_var) }
      history = []
      define_method("#{attribute}=") do |v| 
        history.push(v)
        instance_variable_set(instance_var, v)
        instance_variable_set(history_name, history)
      end
      define_method("#{attribute}_history"){ instance_variable_get(history_name) }      
    end       
  end

  def strong_attr_accessor(name, type)
    var_name = "@#{name}".to_sym
    define_method(name){ instance_variable_get(var_name) }
    define_method("#{name}=".to_sym) do |v|
      raise TypeError unless v.is_a? type
      instance_variable_set(var_name, v)
    end
  end
end
