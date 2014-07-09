class Trade
  include Mongoid::Document
  has_many :students
  has_many :sections
  belongs_to :Course
end
