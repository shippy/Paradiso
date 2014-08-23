class Student < ActiveRecord::Base
  has_many :sections, through: :attendances
  has_many :requests
end
