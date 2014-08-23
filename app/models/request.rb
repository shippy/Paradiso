class Request < ActiveRecord::Base
  belongs_to :student
  belongs_to :original_section, class_name: 'Section'
  belongs_to :target_section, class_name: 'Section'
  
  validates :student, :original_section, :target_section, :active, presence: true
end
