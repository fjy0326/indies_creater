class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.text :profile
      t.integer :genres_id
      t.timestamps
    end
  end
end
