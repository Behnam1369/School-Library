class Person
  attr_accessor :name, :age
  attr_reader :id

  def initialize(age, name = 'Unknown', parent_permission = nil)
    @age = age
    @name = name
    parent_permission = true if parent_permission.nil?
    @parent_permission = parent_permission
  end

  def of_age?
    @age >= 18
  end

  def can_use_services?
    if @age >= 18 || @parent_permission
      true
    else
      false
    end
  end
end

# p1 = Person.new(12, 'Behnam', false)
# p p1

# p2 = Person.new(12, 'Behnam')
# p p2

# p3 = Person.new(12)
# p p3
