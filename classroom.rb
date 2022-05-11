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
