require_relative "location.rb"
require_relative "movie.rb"
require_relative "movie_location.rb"
require_relative "review.rb"
require_relative "user.rb"

class CommandLine

    attr_accessor :user

    def initialize
        self.logo
        self.welcome_message
        self.login_or_create_prompt
    end

    def logo
        puts "
        _______.  ______  _______ .__   __.  _______     __  .___________. __
        /       | /      ||   ____||  \ |  | |   ____|   |  | |           ||  |
       |   (----`|  ,----'|  |__   |   \|  | |  |__      |  | `---|  |----`|  |
        \   \    |  |     |   __|  |  . `  | |   __|     |  |     |  |     |  |
    .----)   |   |  `----.|  |____ |  |\   | |  |____    |  |     |  |     |__|
    |_______/     \______||_______||__| \__| |_______|   |__|     |__|     (__)

        "
    end

    def welcome_message
        puts "Welcome to Scene It!"
        puts "\n"
        puts "This is an app designed to find movie and TV show film locations from all around the world!"
        puts "\n"
    end

    def login_or_create_prompt
        puts "Choose one of the options below:"
        puts "1. Create an account"
        puts "2. Log in with username"
    end

    def create_account
        puts "What is your name?"
        name_input = gets.chomp
        puts "Create a username:"
        username_input = gets.chomp
        
        if User.exists?(["LOWER(username)=?", username_input.downcase]) == true
            puts "You already have an account! Please log into your account."
            login
            puts "\n"
        end
        @current_user = User.create(name: name_input, username: username_input)
        puts "Welcome, #{name_input}!"
        success_created_account_message
    end

    def login
        puts "Enter username"
        input = gets.chomp
        #Check if in database
        user1 = User.find_by("LOWER(username)=?", input.downcase)
        puts "Welcome, #{user1.name}!"
        # Return user object
        @current_user = user1
    end

    def find_user_reviews
        user = login
        puts "\n"
        puts "Here are your reviews:"
        puts "\n"
        user.reviews.each do |review|
            puts "Movie/TV Show Title: #{review.movie_location.movie.name}"
            puts "Location: #{review.movie_location.location.name}"
            review.print_formatted
        end
    end


    def success_login_message
        puts "You've successfully logged into your account!"
    end

    def success_created_account_message
        puts "You've successfully created an account!"
    end

    def main_menu
        puts "Please choose one of the menu options below:"
        puts "\n"
        puts "Menu:"
        puts "\n"
        puts "1. Search for film locations by movie or TV show"
        puts "2. Search for movies or TV shows filmed in a certain city"
        puts "3. Search for movies or TV show by landmark"
        puts "4. Add a movie or TV show to the database"
        puts "5. Add a location to a movie or TV show"
        puts "6. Review a film location"
        puts "7. Show all my reviews"
        puts "8. Look up all the reviews by film location"
        puts "9. Find the highest-rated film location"
        puts "10. Find the top-5 film locations"
        puts "11. Delete a review"
        puts "12. Exit program"
        puts "\n"
    end

    def main_menu_choice

        user_choice = gets.chomp
        case user_choice
        when "1"
            self.search_for_locations_by_movie
        when "2"
            self.search_for_movie_by_city
        when "3"
            self.search_for_movie_by_landmark
        when "4"
            self.add_movie_to_database
        when "5"
            self.add_location_to_movie
        when "6"
            @current_user.write_a_review
        when "7"
            @current_user.reviews
        when "8"
            self.reviews_by_landmark
        when "9"
            MovieLocation.highest_rated_movie_location
        when "10"
            MovieLocation.top_five_movie_locations
        when "11"
            @current_user.delete_review
        when "12"
            exit
        when "exit", "quit", "!!!", "q"
            exit
        else
            puts "\n"
            puts "Please enter the number that corresponds with menu option."
            main_menu_choice
        end
            self.return_to_menu?
            self.main_menu_choice
    end

    def return_to_menu?
        puts "Would you like to return to the main menu?(Y/N)"
        user_input = gets.chomp.downcase
        if user_input == "y"
            self.main_menu
        else
            exit
        end
    end


    def search_for_locations_by_movie
        puts "Enter a movie or TV show"
        user_input = gets.chomp
        #Check if exists in database
        if Movie.find_movie(user_input) == nil
            puts "This movie or TV show does not yet exist in the database!"
            puts "Do you want to add this movie to the database? (y/n)"
            answer = gets.chomp.downcase
            if answer == "y"
                add_movie_to_database
            else
                return nil
            end
        else
        # puts "#{user_input}"
        puts "\n"
        movie_object = Movie.find_movie(user_input)
        movie_object.locations.map do |location|
            location.formatted_print
            location.movie_locations.map do |movielocation|
                puts "Scene Description: #{movielocation.scene_description}"
                puts "\n"
            end
        end
    end
    end

    def search_for_movie_by_city
        puts "Enter city name"
        user_input_city = gets.chomp
        puts "\n"
        puts "Enter country name"
        user_input_country = gets.chomp
        puts "\n"
        location_object = Location.find_location_by_city(user_input_city, user_input_country)
        puts "All movies or TV show filmed in #{user_input_city.titleize}, #{user_input_country.titleize}:"
        location_object.movies.map do |movies|
            movies.formatted_print
        end
    end

    def search_for_movie_by_landmark
        puts "Enter landmark name"
        user_input_landmark = gets.chomp
        puts "\n"
        location_object = Location.find_location_by_name(user_input_landmark)
        location_object.movies.map do |movies|
            movies.formatted_print
        end
    end

    def reviews_by_landmark
        puts "Find all reviews by searching for a landmark"
        puts "Landmark:"
        user_input_landmark = gets.chomp
        if Location.find_location_by_name(user_input_landmark) == nil
            puts "This landmark does not yet exist in the database!"
            return nil
            # puts "Do you want to add this landmark to the database?(y/n)"
            # answer = gets.chomp.downcase
            # if answer == "y"
            #     add_location_to_movie
            # else
            #     return nil
            # end
        else
            location_object = Location.find_location_by_name(user_input_landmark)
        end
        movie_loc = MovieLocation.where(location_id: location_object.id)
        movie_loc.each do |movielocation|
            movielocation.reviews.each do |review|
                puts "\n"
                puts "Movie/TV Show: #{review.movie_location.movie.name}"
                puts "Location: #{review.movie_location.location.name}"
                puts "Scene Description: #{review.movie_location.scene_description}"
                puts "Review: #{review.review}"
                puts "Rating: #{review.rating}"
                puts "\n"
            end
        end
    end

    def add_movie_to_database
        puts "Which movie or TV show you would like to add?"
        user_input_movie_or_TVshow = gets.chomp
        puts "\n"
        puts "Is this a movie or a TV show?"
        user_input_type = gets.chomp
        puts "\n"
       data = Movie.check_if_movie_in_database(user_input_movie_or_TVshow, user_input_type)
        if data == true
            puts " This movie alreadys exists in the database"
        else
            capitalized_movie_name = user_input_movie_or_TVshow.titleize
            Movie.create(name: capitalized_movie_name,movie_or_tvshow: user_input_type)
            puts "#{capitalized_movie_name} was successfully added to the database"

        end
    end

    def add_location_to_movie
        puts "Which movie or TV show would you like to add a location to?"
        user_input = gets.chomp
        check = Movie.check_if_movie_name_in_database(user_input)
        if check == false
            puts "This movie or TV show is not yet in the database!"
            puts "Please add the movie or the TV show to the database."
            puts "\n"
            add_movie_to_database
        else
            puts "\n"
            movie = Movie.find_movie(user_input)
            puts "What is the name of the landmark?"
            input_location = gets.chomp
            puts "\n"
            puts "What city is the landmark in?"
            input_city = gets.chomp
            puts "\n"
            puts "What country is the landmark in?"
            input_country = gets.chomp
            puts "\n"
            puts "What is the best time of year to visit? (Summer, Spring, Winter, Fall)"
            input_season = gets.chomp
            puts "\n"
            puts "Describe the scene filmed at that landmark."
            input_description = gets.chomp
            puts "\n"
            loc = Location.create(name: input_location, city: input_city, country: input_country, best_season_to_visit: input_season)
            MovieLocation.create(movie_id: movie.id, location_id: loc.id, scene_description: input_description)
            puts "\n"
            puts "This location has been successfully added to the database!"
        end
    end




end