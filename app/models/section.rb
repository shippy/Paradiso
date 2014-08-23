class Section < ActiveRecord::Base
  has_many :students, through: :attendances
  belongs_to :course
end
