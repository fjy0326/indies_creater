class AddFileToMusic < ActiveRecord::Migration[6.1]
  def change
    add_column :musics, :file, :string
  end
end
