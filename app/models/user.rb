class User < ActiveRecord::Base


has_many :reviews
has_many :movie_locations, through: :reviews

    def reviews
        reviews = Review.where(user_id: self.id)
        reviews.each do |review|
            puts "Movie/TV Show: #{review.movie_location.movie.name}"
            puts "Location: #{review.movie_location.location.name}" 
            puts "Scene Description: #{review.movie_location.scene_description}"
            review.print_formatted
        end
    end

    def write_a_review
        puts "Which location would you like to review?"
        location_input = gets.chomp
        location = Location.find_location_by_name(location_input)
        puts "\n"
        puts "Which movie or TV show does the location appear in?"
        movie_input = gets.chomp
        movie = Movie.find_movie(movie_input)
        mov_loc = MovieLocation.where(location_id: location.id, movie_id: movie.id)
        if user_review_exists?(self.id, mov_loc[0].id) == true
            puts "You've already reviewed this location! Do you want to update your review?"
            answer = gets.chomp
            if answer == "yes"
                #Insert update review method
            else 
                #Return to main menu
            end
        end
        puts "\n"
        puts "What is your review of this film location?"
        review1 = gets.chomp
        puts "\n"
        puts "What is your rating of this film location? (1 to 5, 5 being the highest)"
        rating1 = gets.chomp
        new_review = Review.create(user_id: self.id, movie_location_id: mov_loc[0].id, review: review1, rating: rating1)
        puts "\n"
        puts "Movie/TV Show: #{movie.name}"
        puts "Location: #{location.name}" 
        new_review.print_formatted
    end

    def user_review_exists?(user_id, user_movie_location_id)
        Review.exists?(user_id: user_id, movie_location_id: user_movie_location_id)
    end


    #Delete a review


end