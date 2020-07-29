class MovieLocation < ActiveRecord::Base


belongs_to :movie
belongs_to :location
has_many :reviews

    def self.find_movie_locations_by_movie(movie_object)
        # Takes in an argument of a movie object
        # Find all MovieLocations where movie_id = movie_object.id
        self.all.select do |movielocation|
            movielocation.movie_id == movie_object.id
        end
    end

    def self.find_movie_location_by_location(location_object)
        # Takes in an argument of a location object
        # Find all MovieLocations where location_id = location_object.id
        self.all.select do |movielocation|
            movielocation.location_id == location_object.id
        end
    end

    
end