class CreateMusics < ActiveRecord::Migration[6.1]
  def change
    create_table :musics do |t|
      t.text :body

      t.timestamps
    end
  end
end
