class MovieLocation < ActiveRecord::Base

    belongs_to :movie
    belongs_to :location
    has_many :reviews


end