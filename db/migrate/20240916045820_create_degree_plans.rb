class CreateDegreePlans < ActiveRecord::Migration[6.1]
  def change
    create_table :degree_plans, primary_key: :did do |t|
      t.string :degree_name, limit: 255
      t.integer :major_id
      t.integer :required_courses, array: true, default: []
      t.integer :core_courses, array: true, default: []

      t.timestamps
    end

    add_index :degree_plans, :major_id
  end
end