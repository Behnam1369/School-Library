require './student'

class Classroom
  attr_accessor :label
  attr_reader :student_list

  def initialize(label)
    @label = label
    @student_list = []
  end

  def add_student(student)
    return if @student_list.include? student

    @student_list.push(student)

    return if student.classroom == self

    student.belongs_to(self)
  end
end

c1 = Classroom.new("B")
s1 = Student.new(12, "MAth", "asdsadsad")
c1.add_student(s1)
c1.add_student(s1)
s1.belongs_to(c1)

p c1.student_list.length
