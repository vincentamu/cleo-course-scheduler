class Course < ApplicationRecord
  self.primary_key = :crn

  belongs_to :emphasis, optional: true
  belongs_to :track, optional: true
  belongs_to :core, optional: true
  has_many :pre_reqs, foreign_key: :crn
  has_many :prerequisites, through: :pre_reqs, source: :prerequisite
  has_many :inverse_pre_reqs, class_name: 'PreReq', foreign_key: :prereq_crn
  has_many :dependent_courses, through: :inverse_pre_reqs, source: :course
  has_many :my_degree_plans
  has_many :degree_plans, through: :my_degree_plans
  has_and_belongs_to_many :students, join_table: :students_courses, foreign_key: :crn, association_foreign_key: :uin

  validates :cname, presence: true, length: { maximum: 255 }
  validates :credit_hours, :lecture_hours, :lab_hours, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end