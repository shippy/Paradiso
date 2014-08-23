class Student < ActiveRecord::Base
  has_many :attendances
  has_many :sections, through: :attendances
  has_many :requests

  #validates :name, :netid, :email, presence: true
  #validates_email_format_of :email, :message => 'is invalid.'
end
