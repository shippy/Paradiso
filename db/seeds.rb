# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

course = Course.create(name: "Introduction to Github", email: "testcourse@example.com")
6.times do |i|
  Section.create(professor: ["Robert Reed", "Marvin Chun", "Robert Feynman", "Linus Torvalds", "John Travolta"].sample,
                 time_slot: ["TTh 1:00-2:15", "MWF 10:25-11:15", "WF 1:00-3:00", "TTh 9:00-10:15", "MW 9:00-10:15", "MWF 2:00-2:50"].sample,
                 place: ["STOECK 104", "WLH 211", "LOM 222", "WLH 201", "KKK 666"].sample, course: course)
end
30.times do |i|
  student = Student.create(name: ["Qinyang Chen", "Carsten Peterson", "Hannia Zia", "Sarah Hamilton", "Sylvan Zheng", "Simon Podhajasky"].sample, netid: "te#{i}", email: "test#{i}@example.com")
  Attendance.create(student: student, section: Section.all.sample)
end

20.times do |i|
  s = Student.all.sample
  sect = s.sections.sample
  target = Section.where.not(id: sect.id).sample
  Request.create(student: s, original_section: sect, target_section: target, course: course, active: true)
end
