class Movie < ActiveRecord::Base


    has_many :movie_locations
    has_many :locations, through: :movie_locations

    def self.find_movie(user_input_movie)
        # Takes in an argument of a string of user input (movie or TV show)
        # Find Movies whose name fits user_input
        # Return movie object

        self.all.select do |movie|
            movie.name.downcase == user_input_movie.downcase
        end
    end
    

end