class Module
  # Similar to <tt>attr_*</tt> but can also generate private
  # getter/setter methods for class internal use only. Useful
  # for enforcing Smalltalk-style internal encapsulation.
  def attribute(*attributes, getter: false, setter: false)
    attributes.each do |attribute|
      instance_var_name = "@#{attribute}"

      define_method(attribute) do
        instance_variable_get(instance_var_name)
      end

      define_method("#{attribute}=") do |value|
        instance_variable_set(instance_var_name, value)
      end

      self.send(:private, attribute) unless getter
      self.send(:private, "#{attribute}=") unless setter
    end
    nil # like attr_accessor
  end

  alias_method :attributes, :attribute
  private :attributes, :attribute
end
