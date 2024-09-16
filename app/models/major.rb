class Major < ApplicationRecord
  self.primary_key = :mid

  has_many :students
  has_many :degree_plans

  validates :major_name, :college_name, presence: true, length: { maximum: 255 }
end