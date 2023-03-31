class Core::Command
  include ActiveModel::Validations

  attr_accessor :token

  def initialize(attributes = {})
    attributes.each do |name, value|
      if methods.include? "#{name}=".to_sym
        method("#{name}=".to_sym).call(value)
      end
    end
  end

  # this method can be ovveridden in other classes
  def run
  end
end