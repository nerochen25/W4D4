class CreateAlbums < ActiveRecord::Migration[5.2]
  def change
    create_table :albums do |t|
      t.string :album_title, null: false
      t.integer :year, null: false
      t.integer :band_id, null: false
      t.boolean :live, null: false
      t.timestamps
    end
    add_index :albums, :album_title, unique: true
    add_index :albums, :year
    add_index :albums, :band_id
  end
end
