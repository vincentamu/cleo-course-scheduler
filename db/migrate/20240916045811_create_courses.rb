class CreateCourses < ActiveRecord::Migration[6.1]
  def change
    create_table :courses, primary_key: :crn do |t|
      t.string :cname, limit: 255
      t.text :description
      t.integer :credit_hours
      t.integer :lecture_hours
      t.integer :lab_hours

      t.timestamps
    end
  end
end