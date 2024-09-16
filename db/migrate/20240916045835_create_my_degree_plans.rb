class CreateMyDegreePlans < ActiveRecord::Migration[6.1]
  def change
    create_table :my_degree_plans, primary_key: [:my_did, :crn] do |t|
      t.integer :my_did
      t.integer :crn

      t.timestamps
    end

    add_index :my_degree_plans, :my_did
    add_index :my_degree_plans, :crn
  end
end