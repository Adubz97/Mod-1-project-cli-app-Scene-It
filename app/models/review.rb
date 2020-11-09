class Review < ActiveRecord::Base

belongs_to :user
belongs_to :movie_location

    def print_formatted
        puts "Rating: #{self.rating}"
        puts "Review: #{self.review}\n"
    end

end