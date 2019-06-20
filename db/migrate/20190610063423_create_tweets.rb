class CreateTweets < ActiveRecord::Migration[5.2]
  def change
    create_table :tweets do |t|
      t.string :text
      t.integer :user_id
      t.text :image
      t.integer :likes_count
      t.timestamps
    end
  end
end
