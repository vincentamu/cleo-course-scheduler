class DegreePlan < ApplicationRecord
  self.primary_key = :did

  belongs_to :major
  has_many :students
  has_many :my_degree_plans
  has_many :courses, through: :my_degree_plans

  validates :degree_name, presence: true, length: { maximum: 255 }
  validates :required_courses, :core_courses, presence: true, array: true
end