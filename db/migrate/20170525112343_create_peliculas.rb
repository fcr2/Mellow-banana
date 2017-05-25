class CreatePeliculas < ActiveRecord::Migration[5.0]
  def change
    create_table :peliculas do |t|
      t.string :name
      t.integer :rating
      t.string :main_actor
      t.string :Synopsis
      t.string :launching

      t.timestamps
    end
  end
end
