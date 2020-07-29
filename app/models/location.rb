class Location < ActiveRecord::Base

    has_many :movie_locations
    has_many :movies, through: :movie_locations

    def self.find_location_by_name(user_input_location_name)
        self.all.select do |location|
            location.name.downcase == user_input_location_name.downcase
        end
    end

    def self.find_location_by_city(user_input_city, user_input_country)
        self.all.select do |location|
            location.city.downcase == user_input_city.downcase && 
            location.country.downcase == user_input_country.downcase
        end
    end

end