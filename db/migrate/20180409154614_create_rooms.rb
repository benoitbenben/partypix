class CreateRooms < ActiveRecord::Migration[5.1]
  def change
    create_table :rooms do |t|
      t.string :name
      t.date :date
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
