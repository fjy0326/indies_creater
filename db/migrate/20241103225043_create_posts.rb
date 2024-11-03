class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :introduction
      #imageのデータベースがまだ作られていない
      t.text :body
      t.text :link
      t.timestamps
    end
  end
end
