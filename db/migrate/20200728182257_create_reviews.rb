class CreateReviews < ActiveRecord::Migration[6.0]
  
  
  def change
    create_table :reviews do |t|
      t.integer :user_id
      t.integer :movie_location_id
      t.text :review
      t.integer :rating
    end
  end
end
