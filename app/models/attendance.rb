class Attendance < ActiveRecord::Base
  belongs_to :student
  belongs_to :section

  #validate :one_course_per_student

  def one_course_per_student
    courses = student.sections.pluck(:course_id)
    unless courses.length == courses.uniq.length
      errors.add(:section, "Student cannot attend multiple sections of the same course.")
    end
  end
end
