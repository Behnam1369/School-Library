require './person'

class Student < Person
  def initialize(age, classroom, name = 'Unknown', parent_permission = nil)
    super(age, name, parent_permission)
    @classroom = classroom
  end

  def play_hooky
    "¯\(ツ)/¯"
  end
end

# s1 = Student.new(16, "B", "Behnam", false)
# p s1

# s2 = Student.new(16, "B", "Behnam")
# p s2

# s3 = Student.new(16, "B")
# p s3
