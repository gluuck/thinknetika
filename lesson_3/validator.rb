module Validation
  def validate(name, type, *args)
    var_name = "@#{name}".to_sym
    var_type = "#{type}".to_sym
    define_method(name){instance_variable_get(var_name)}
    define_method(type){instance_variable_get(var_type)}
    define_method("#{name}=".to_sym) do |v|
      case var_type
      when :presence
        raise "#{name} can`t be empty" if v.nil? || v.empty?
        instance_variable_set(var_name,v)
      when :type
        raise TypeError unless v.is_a? args[0]
        instance_variable_set(var_name,v)
      when :format
        raise "not right" if v !~ args[0]
        instance_variable_set(var_name,v)
       end
    end
  end
end

module Validator
  def valid?
    validate
  rescue StandardError
    false
  end
end
