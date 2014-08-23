# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

course = Course.create(name: "Introduction to Github", email: "testcourse@example.com")
6.times do |i|
  Section.create(professor: "professor#{i}@example.com", time_slot: "time_slot##{i}", place: "test place #{i}", course: course)
end
30.times do |i|
  student = Student.create(name: "Test Student ##{i}", netid: "te#{i}", email: "test#{i}@example.com")
  Attendance.create(student: student, section: Section.all.sample)
end

20.times do |i|
  s = Student.all.sample
  sect = s.sections.sample
  target = Section.where.not(id: sect.id).sample
  Request.create(student: s, original_section: sect, target_section: target, course: course, active: true)
end
