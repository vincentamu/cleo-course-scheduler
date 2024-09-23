# frozen_string_literal: true

class StudentLogin < ApplicationRecord
    devise :omniauthable, omniauth_providers: [:google_oauth2]
  
    validates :uid, presence: true
  
    belongs_to :student, optional: true
  
    def self.from_google(email:, full_name:, uid:, avatar_url:)
      student_login = find_or_initialize_by(email: email)
      student_login.update(avatar_url: avatar_url)
  
      if student_login.student.nil?
        first_name, last_name = full_name.split(' ', 2) # Split into first and last names
        student = Student.new(email: email, first_name: first_name, last_name: last_name)
        student_login.student = student if student.save
      end
  
      student_login
    end
  end
