class Course
  include Mongoid::Document
  field :professor, type: String
  field :prof_email, type: String
  field :times, type: Array
  field :location, type: String
  belongs_to :Project
  has_many :sections
end
