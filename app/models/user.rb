class User < ActiveRecord::Base


has_many :reviews
has_many :movie_locations, through: :reviews

    attr_accessor :name, :username

end