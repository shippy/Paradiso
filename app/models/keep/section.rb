class Section
  include Mongoid::Document
  belongs_to :course
  field :teacher, type: String
  field :email, type: String
  field :times, type: Array
  field :location, type: String
  has_many :students
end
