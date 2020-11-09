class Location < ActiveRecord::Base

    has_many :movie_locations
    has_many :movies, through: :movie_locations

    def self.find_location_by_name(user_input_location_name)
         Location.find_by("LOWER(name)=?",user_input_location_name.downcase)
    end

    def self.find_location_by_city(user_input_city, user_input_country)
        Location.find_by(["LOWER(city)=? AND LOWER(country)=?",
            user_input_city.downcase,user_input_country.downcase])
    end

    def formatted_print
        puts " \nName: #{self.name}"
        puts "City: #{self.city}"
        puts "Country: #{self.country}"
        puts "Best Season to Visit: #{self.best_season_to_visit}"
    end

end