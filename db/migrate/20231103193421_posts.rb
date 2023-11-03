class Posts < ActiveRecord::Migration[7.1]
  def change
    create_table :posts do |t|
      t.integer :author_id
      t.string :title
      t.string :text
      t.integer :likes_counter
      t.integer :comments_counter
      t.timestamps
    end
    add_index :posts, :author_id
  end
end
