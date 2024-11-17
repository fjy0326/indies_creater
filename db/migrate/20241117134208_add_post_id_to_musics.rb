class AddPostIdToMusics < ActiveRecord::Migration[6.1]
  def change
    add_reference :musics, :post, null: false, foreign_key: true
  end
end
