class Student
  include Mongoid::Document
  field :id, type: String
  field :netid, type: String
  field :name, type: String
  field :email, type: String
  has_many :sections
  has_many :exceptions
  has_many :desires
  has_many :trades
end