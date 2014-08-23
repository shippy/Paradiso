class Course < ActiveRecord::Base
  has_many :sections

  validates :name, :email, presence: true
  validates_email_format_of :email, :message => 'is invalid.'
end
