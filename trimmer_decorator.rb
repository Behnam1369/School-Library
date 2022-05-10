require './base_decorator'

class TrimmerDecorator < BaseDecoraroe
  def initialize(nameable)
    super
    @nameable = nameable
  end

  def correct_name
    @nameable.correct_name[0..9]
  end
end
