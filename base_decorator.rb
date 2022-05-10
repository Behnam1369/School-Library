require './nameable'

class BaseDecoraroe < Nameable
  def initialize(nameable)
    super()
    @nameable = nameable
  end

  def correct_name
    @nameable.correct_name
  end
end

# n1 = BaseDecoraroe.new(Nameable.new)
# p n1.correct_name
