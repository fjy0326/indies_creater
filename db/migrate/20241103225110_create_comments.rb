class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.string :genre
      t.text :comment_text
      t.timestamps
    end
  end
end
