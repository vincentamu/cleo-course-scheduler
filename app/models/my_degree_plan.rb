class MyDegreePlan < ApplicationRecord
  self.primary_keys = :my_did, :crn

  belongs_to :degree_plan, foreign_key: :my_did
  belongs_to :course, foreign_key: :crn

  validates :my_did, :crn, presence: true
end