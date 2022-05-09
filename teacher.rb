require './person'

class Teacher < Person
  def initialize(age, specialization, name = 'Unknown', parent_permission = nil)
    super(age, name, parent_permission)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end

# t1 = Teacher.new(16, "Math", "Behnam", false)
# p t1

# t2 = Teacher.new(16, "Math", "Behnam")
# p t2

# t3 = Teacher.new(16, "Math")
# p t3
