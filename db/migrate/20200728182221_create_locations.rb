class CreateLocations < ActiveRecord::Migration[6.0]
  
  
  def change
    create_table :locations do |t|
      t.text :name
      t.text :city
      t.text :country
      t.text :best_season_to_visit
    end
  end
end
