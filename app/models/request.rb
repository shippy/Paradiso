class Request < ActiveRecord::Base
  belongs_to :student
  belongs_to :original_section, class_name: 'Section'
  belongs_to :target_section, class_name: 'Section'

  #validates :student, :original_section, :target_section, :active, presence: true
  #validate :target_differs_from_origin

  def target_differs_from_origin
    if original_section == target_section
      errors.add(:target_section, "Target Section needs to be different from the current Section." )
    end

  end
end
