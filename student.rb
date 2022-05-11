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
