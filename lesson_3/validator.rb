
module Validation
  def self.included(base)
    base.extend ClassMethods
    base.include Valid
    base.include Validator
  end
  
  module ClassMethods
    attr_reader :validate_arr

    def validate(name, type, *args)
      @validate_arr = []
      @validate_arr.push([name, type, args])
    end
  end

  module Valid
    def validate!
      self.class.validate_arr.each do |name, type, args|
        errors = []
        var_name = instance_variable_get("@#{name}".to_sym)
        var_type = instance_variable_get("#{type}".to_sym)
        case var_type
        when :presence
          errors << "#{name} can`t be empty or nil" if v.nil? || v.empty?
        when :type
          errors << "#{name} is not #{args.to_s}." unless v.is_a? args[0]
        when :format
          errors << "#{name} is not fit #{args.to_s} format" if v !~ args[0]
         end
         raise errors.join(" ") unless errors.empty?
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
end
