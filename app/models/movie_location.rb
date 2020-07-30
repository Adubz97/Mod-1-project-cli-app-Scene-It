class MovieLocation < ActiveRecord::Base

    belongs_to :movie
    belongs_to :location
    has_many :reviews

    def rating
        review = Review.where(movie_location_id: self.id)
        review.map do |review|
            review.rating
        end
    end

    def average_rating
        array = self.rating
        if array == [] || nil
            average = 0
        else
        average = array.inject(0, :+)/array.length
        end
    end

    def self.highest_rated_movie_location
        #Find movie location with highest average rating
        best_movie_location = self.all.max_by do |movielocation|
            movielocation.average_rating
        end
        puts "\n"
        puts "Highest rated movie or TV show location: #{best_movie_location.location.name}"
        puts "Name of movie or TV show: #{best_movie_location.movie.name}"
        puts "Scene description: #{best_movie_location.scene_description}"
        puts "\n"
    end

    def self.top_five_movie_locations
        self.all.limit(3) do |movielocation|
            movielocation.average_rating
        end
    end
end