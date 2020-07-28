class RenameTypeToMovieOrTvshow < ActiveRecord::Migration[6.0]
  
  
  
  
  
  
  
  def change
    rename_column :movies, :type, :movie_or_tvshow
  end
end
