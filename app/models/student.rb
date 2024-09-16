class Student < ApplicationRecord
    self.primary_key = :uin
  
    belongs_to :major
    belongs_to :degree_plan
    has_and_belongs_to_many :courses, join_table: :students_courses, foreign_key: :uin, association_foreign_key: :crn
  
    enum enrol_semester: { Fall: 'Fall', Spring: 'Spring' }
    enum grad_semester: { Fall: 'Fall', Spring: 'Spring' }
  
    validates :first_name, :last_name, :email, presence: true, length: { maximum: 255 }
    validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
    validates :enrol_year, :grad_year, presence: true, numericality: { only_integer: true }
    validates :enrol_semester, :grad_semester, presence: true
    validates :enrolled_courses, presence: true, array: true
  end