class CreateStudents < ActiveRecord::Migration[6.1]
  def change
    create_table :students, primary_key: :uin do |t|
      t.string :first_name, limit: 255
      t.string :last_name, limit: 255
      t.string :email, limit: 255
      t.integer :enrol_year
      t.string :enrol_semester
      t.integer :grad_year
      t.string :grad_semester
      t.integer :major_id
      t.integer :degree_plan_id
      t.integer :enrolled_courses, array: true, default: []

      t.timestamps
    end

    add_index :students, :major_id
    add_index :students, :degree_plan_id
  end
end