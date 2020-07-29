class Movie < ActiveRecord::Base


    has_many :movie_locations
    has_many :locations, through: :movie_locations

    def self.find_movie(user_input_movie)
        self.all.select do |movie|
            movie.name.downcase == user_input_movie.downcase
        end
    end

end