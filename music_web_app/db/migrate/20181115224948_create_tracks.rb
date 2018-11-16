class CreateTracks < ActiveRecord::Migration[5.2]
  def change
    create_table :tracks do |t|
      t.string :track_title, null: false
      t.integer :ord, null: false
      t.boolean :regular, null: false
      t.integer :album_id, null: false
      t.timestamps
    end
    add_index :tracks, :track_title
    add_index :tracks, :ord
    add_index :tracks, :regular
  end
end
