class AddGenreToUsers < ActiveRecord::Migration[6.1]
  def change
    add_reference :users, :genre, foreign_key: true
  end
end
