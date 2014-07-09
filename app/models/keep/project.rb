class Project
  include Mongoid::Document
  field :name, type: String
  field :admin_name, type: String
  field :admin_email, type: String
  field :URL, type: String
  has_many :courses
end
