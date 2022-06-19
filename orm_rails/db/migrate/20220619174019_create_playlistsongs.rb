class CreatePlaylistsongs < ActiveRecord::Migration[7.0]
  def change
    create_table :playlistsongs do |t|
      t.belongs_to :playlist, null: false, foreign_key: true
      t.belongs_to :song, null: false, foreign_key: true

      t.timestamps
    end
  end
end
