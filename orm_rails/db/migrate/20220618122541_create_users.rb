class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.belongs_to :subscription, null: false, foreign_key: true
      t.belongs_to :playlist, null: false, foreign_key: true

      t.timestamps
    end
  end
end