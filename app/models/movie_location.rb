class MovieLocation < ActiveRecord::Base


belongs_to :movie
belongs_to :location
has_many :reviews

    def self.find_movie_locations_by_movie(movie_object)
        self.all.select do |movielocation|
            movielocation.movie_id == movie_object.id
        end
    end

    
end