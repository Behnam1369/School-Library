require './person'

class Student < Person
  attr_accessor :classroom

  def initialize(age, classroom, name = 'Unknown', parent_permission = nil)
    super(age, name, parent_permission)
    @classroom = classroom
  end

  def play_hooky
    "¯\(ツ)/¯"
  end

  def belongs_to(classroom)
    return if self.classroom == classroom

    @classroom = classroom

    return if classroom.student_list.include? self

    classroom.student_list.push(self)
  end
end

# s1 = Student.new(16, "B", "Behnam", false)
# p s1

# s2 = Student.new(16, "B", "Behnam")
# p s2

# s3 = Student.new(16, "B")
# p s3

