require './base_decorator'

class CapitalizeDecorator < BaseDecoraroe
  def initialize(nameable)
    super
    @nameable = nameable
  end

  def correct_name
    @nameable.correct_name.upcase
  end
end

# c1 = CapitalizeDecorator.new(Nameable.new)
# p c1.correct_name
