class User < ActiveRecord::Base
  validates :first_name,  :presence => true
  validates :last_name,   :presence => true
  validates :student,     :presence => true
end
