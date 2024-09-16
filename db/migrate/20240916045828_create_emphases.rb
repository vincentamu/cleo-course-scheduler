class CreateEmphases < ActiveRecord::Migration[6.1]
  def change
    create_table :emphases, primary_key: :emphasis_id do |t|
      t.string :emphasis_name, limit: 255

      t.timestamps
    end
  end
end