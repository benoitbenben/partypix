class CreateUpvotes < ActiveRecord::Migration[5.1]
  def change
    create_table :upvotes do |t|
      t.references :user, foreign_key: true
      t.references :picture, foreign_key: true

      t.timestamps
    end
  end
end
