class CreateReviews < ActiveRecord::Migration[8.0]
  def change
    create_table :reviews do |t|
      t.integer :rating
      t.text :content
      t.integer :user_id
      t.integer :book_id

      t.timestamps
    end
  end
end
