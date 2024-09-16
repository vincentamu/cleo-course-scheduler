class CreateMajors < ActiveRecord::Migration[6.1]
  def change
    create_table :majors, primary_key: :mid do |t|
      t.string :major_name, limit: 255
      t.string :college_name, limit: 255

      t.timestamps
    end
  end
end