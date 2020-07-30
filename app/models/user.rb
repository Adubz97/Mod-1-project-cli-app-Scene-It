
class User < ActiveRecord::Base


has_many :reviews
has_many :movie_locations, through: :reviews

    def reviews
        reviews = Review.where(user_id: self.id)
        if reviews == []
            puts "You haven't written any reviews yet!"
        else
            puts "Your Reviews:"
            puts "\n"
            reviews.each do |review|
                puts "Movie/TV Show: #{review.movie_location.movie.name}"
                puts "Location: #{review.movie_location.location.name}" 
                puts "Scene Description: #{review.movie_location.scene_description}"
                review.print_formatted
            end
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
            puts "You've already reviewed this location! Do you want to update your review? (yes/no)"
            old_review = Review.find_by(user_id: self.id, movie_location_id: mov_loc[0].id)
            answer = gets.chomp
            if answer == "yes"
                update_review(old_review)
            else
                return nil
            end
        else
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
    end

    def user_review_exists?(user_id, user_movie_location_id)
        Review.exists?(user_id: user_id, movie_location_id: user_movie_location_id)
    end


    def delete_review
        puts "To delete a review, enter the name of the movie location that you reviewed:"
        mov_loc_name = gets.chomp
        loc = Location.find_by(name: mov_loc_name) #remove
        mov_loc = MovieLocation.find_by(location_id: loc.id) #remove
        review = Review.find_by(movie_location_id: mov_loc.id, user_id: self.id)
        puts "\n"
        puts "Movie/TV Show: #{review.movie_location.movie.name}"
        puts "Location: #{review.movie_location.location.name}" 
        puts "Scene Description: #{review.movie_location.scene_description}"
        review.print_formatted
        puts "Are you sure you want to delete this review? (Y/N)"
        answer = gets.chomp.downcase
        if answer == "y"
            review.destroy
            puts "The review has been deleted!"
        end
    end

    def update_review(review)
        puts "Write your updated review below:"
        new_review = gets.chomp
        puts "Update your rating below: (1-5)"
        new_rating = gets.chomp
        review.update(review: new_review, rating: new_rating)
        puts "You've successfully updated your review!"
        puts "\n"
        puts "Movie/TV Show: #{review.movie_location.movie.name}"
        puts "Location: #{review.movie_location.location.name}" 
        puts "Scene Description: #{review.movie_location.scene_description}"
        puts "Review: #{review.review}"
        puts "Rating: #{review.rating}"
        puts "\n"
    end



end