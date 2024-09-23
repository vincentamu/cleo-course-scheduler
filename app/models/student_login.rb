# frozen_string_literal: true

class StudentLogin < ApplicationRecord
  devise :omniauthable, omniauth_providers: [:google_oauth2]

  validates :uid, presence: true

  # Add association to Student
  belongs_to :student, optional: true # optional: true if student might not be present initially

  # Define the method to create or find a student
  def self.from_google(email:, full_name:, uid:, avatar_url:)
    first_name, last_name = full_name.split(' ', 2) 
    student_login = create_with(full_name:, avatar_url:).find_or_create_by!(email:)
    student_login.build_student(email: email, first_name: first_name, last_name:last_name) if student_login.student.blank?
    student_login
  end
end
