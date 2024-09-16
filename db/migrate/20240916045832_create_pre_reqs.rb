class CreatePreReqs < ActiveRecord::Migration[6.1]
  def change
    create_table :pre_reqs do |t|
      t.integer :crn
      t.integer :prereq_crn

      t.timestamps
    end

    add_index :pre_reqs, :crn
    add_index :pre_reqs, :prereq_crn
  end
end