class CreatePosts < ActiveRecord::Migration[6.1]

  def change
    create_table :posts do |t|
      t.string :title
      t.text :introduction
      t.text :body
      t.text :link
      t.integer :user_id
      t.integer :genre
      t.timestamps
    end
  end
end
