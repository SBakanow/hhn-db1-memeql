class CreateArtists < ActiveRecord::Migration[7.0]
  def change
    create_table :artists do |t|
      t.string :first_name
      t.string :last_name
      t.belongs_to :song, null: false, foreign_key: true
      t.belongs_to :album, null: false, foreign_key: true

      t.timestamps
    end
  end
end
