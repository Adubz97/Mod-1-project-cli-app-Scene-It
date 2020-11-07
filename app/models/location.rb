class Location < ActiveRecord::Base

    has_many :movie_locations
    has_many :movies, through: :movie_locations

    # Takes in an argument of location name
    # Finds locations where Location.name = user_input_name
    # Returns Location object
    # self.all.select do |location|
    # location.name.downcase == user_input_location_name.downcase
    def self.find_location_by_name(user_input_location_name)
         Location.find_by("LOWER(name)=?",user_input_location_name.downcase)
    end

    # Takes in an argument city and country
    # Find Locations whose city and country match user input
    # Return Location object
    def self.find_location_by_city(user_input_city, user_input_country)
        Location.find_by(["LOWER(city)=? AND LOWER(country)=?",
            user_input_city.downcase,user_input_country.downcase])
    end

    #Prints a Location object
    def formatted_print
        puts "Name: #{self.name}"
        puts "City: #{self.city}"
        puts "Country: #{self.country}"
        puts "Best Season to Visit: #{self.best_season_to_visit}"
    end

end