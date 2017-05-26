class CreateCountryMaps < ActiveRecord::Migration[5.0]
  def change
    create_table :country_maps do |t|
      t.string :language_name
      t.string :country_name
      t.string :gender

      t.timestamps
    end
  end
end
