class User < ActiveRecord::Base


has_many :reviews
has_many :movie_locations, through: :reviews

    def reviews
        reviews = Review.where(user_id: self.id)
    end
end