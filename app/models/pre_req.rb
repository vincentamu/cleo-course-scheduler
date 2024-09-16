class PreReq < ApplicationRecord
  belongs_to :course, foreign_key: :crn
  belongs_to :prerequisite, class_name: 'Course', foreign_key: :prereq_crn

  validates :crn, :prereq_crn, presence: true
end