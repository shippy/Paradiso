class TargetValidator < ActiveModel::Validator
  def validate(record)
    if record.original_section == record.target_section
      record.errors[:target_section] << "Target Section needs to be different from the current Section." 
    end
  end
end

class Request < ActiveRecord::Base
  include ActiveModel::Validations
  validates_with TargetValidator
  belongs_to :student
  belongs_to :original_section, class_name: 'Section'
  belongs_to :target_section, class_name: 'Section'
  
  validates :student, :original_section, :target_section, :active, presence: true
end

