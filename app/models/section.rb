class Section < ActiveRecord::Base
  has_many :attendances
  has_many :students, through: :attendances
  belongs_to :course

  validates :professor, :time_slot, :place, :course, presence: true
  # validates_email_format_of :professor, :message => 'is invalid.'
end
