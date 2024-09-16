class CreateTracks < ActiveRecord::Migration[6.1]
  def change
    create_table :tracks, primary_key: :tid do |t|
      t.string :track_name, limit: 255

      t.timestamps
    end
  end
end