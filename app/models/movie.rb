class Movie < ActiveRecord::Base

    has_many :movie_locations
    has_many :locations, through: :movie_locations

    def self.find_movie(user_input_movie)
        Movie.find_by("LOWER(name)=?",user_input_movie.downcase)
    end

    def formatted_print
        puts "\nName: #{self.name}"
        puts "Type: #{self.movie_or_tvshow} \n"
    end

    def self.check_if_movie_name_in_database(movie_name)
        Movie.exists?(["LOWER(name)=?",movie_name.downcase])
    end

    def self.check_if_movie_in_database(movie_name, movie_type)
        Movie.exists?(["LOWER(name)=? AND LOWER(movie_or_tvshow)=?",movie_name.downcase,movie_type.downcase])
    end

end