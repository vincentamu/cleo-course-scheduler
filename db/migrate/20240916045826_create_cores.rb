class CreateCores < ActiveRecord::Migration[6.1]
  def change
    create_table :cores, primary_key: :core_id do |t|
      t.string :core_name, limit: 255

      t.timestamps
    end
  end
end