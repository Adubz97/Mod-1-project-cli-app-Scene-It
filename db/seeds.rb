Location.destroy_all
Movie.destroy_all
MovieLocation.destroy_all
Review.destroy_all
User.destroy_all


louvre = Location.create(name:"Louvre",city:"Paris",country:"France",best_season_to_visit:"Spring")
villa_cimbrone = Location.create(name: "Villa Cimbrone", city: "Ravello", country:"Italy",best_season_to_visit:"Spring")
ww = Movie.create(name:"Wonder Woman",movie_or_tvshow:"movie")
# ww_location = MovieLocation.create


ww_louvre = MovieLocation.create(movie_id: ww.id, location_id: louvre.id, scene_description: "The Wayne Enterprises vehicle delivers a suitcase.")
ww_villa = MovieLocation.create(movie_id: ww.id, location_id: villa_cimbrone.id, scene_description: "The seafront terrace of 'Themyscira'")

british_museum = Location.create(name:"British Museum",city:"London",country:"England",best_season_to_visit:"Fall")
mill_bridge = Location.create(name:"Millenium Bridge",city:"London",country:"England",best_season_to_visit:"Fall")
clare_square = Location.create(name:"Claremont Square",city:"London",country:"England",best_season_to_visit:"Fall")
picc_circus = Location.create(name:"Piccadilly Circus",city:"London",country:"England",best_season_to_visit:"Fall")
virginia_lake = Location.create(name:"Virginia Water Lake",city:"Surrey",country:"England",best_season_to_visit:"Fall")
loch_e = Location.create(name:"Loch Etive",city:"Argyle and Butte",country:"Scotland",best_season_to_visit:"Spring")
city_hall = Location.create(name:"City Hall Park",city:"New York City",country:"United States",best_season_to_visit:"Fall")
jersey = Location.create(name:"Jersey City Waterfront Promenade",city:"Jersey City",country:"United States",best_season_to_visit:"Fall")
fdr = Location.create(name:"Franklin Delano Roosevelt Four Freedoms Park",city:"New York City",country:"United States",best_season_to_visit:"Fall")

hp3 = Movie.create(name:"Harry Potter and the Prisoner of Azkaban",movie_or_tvshow:"movie")
hp4 = Movie.create(name:"Harry Potter and the Goblet of Fire",movie_or_tvshow:"movie")
hp5 =Movie.create(name:"Harry Potter and the Order of the Phoenix",movie_or_tvshow:"movie")
hp6 = Movie.create(name:"Harry Potter and the Half-Blood Prince",movie_or_tvshow:"movie")
hp7 = Movie.create(name:"Harry Potter and the Deathly Hallows, Part I",movie_or_tvshow:"movie")
billions = Movie.create(name:"Billions",movie_or_tvshow:"TV show")

hp6_loc = MovieLocation.create(movie_id: hp6.id, location_id: mill_bridge.id, scene_description: "Opening sequence when bridge collapses")
hp5_loc = MovieLocation.create(movie_id: hp5.id, location_id: clare_square.id, scene_description: "Exterior of Grimmauld Place")
hp7_loc = MovieLocation.create(movie_id: hp7.id, location_id: clare_square.id, scene_description: "Exterior of Grimmauld Place")
hp7_loc2 = MovieLocation.create(movie_id: hp7.id, location_id: loch_e.id, scene_description: "Harry, Ron, and Hermione's camping trip")
hp7_loc3 = MovieLocation.create(movie_id: hp7.id, location_id: picc_circus.id, scene_description: "Harry, Ron, and Hermione rush through London's West End")
hp3_loc = MovieLocation.create(movie_id: hp3.id, location_id: virginia_lake.id, scene_description: "Harry rode on Buckbeak")
hp4_loc = MovieLocation.create(movie_id: hp4.id, location_id: virginia_lake.id, scene_description: "Hermione passes messages to Harry and Ron")

bil_loc1 = MovieLocation.create(movie_id: billions.id, location_id: jersey.id, scene_description: "Axe and Taylor have a conversation")
bil_loc2 = MovieLocation.create(movie_id: billions.id, location_id: city_hall.id, scene_description: "Chuck meets with Commissioner Sansome")
bil_loc3= MovieLocation.create(movie_id: billions.id, location_id: fdr.id, scene_description: "Taylor and Wendy have a meeting")

user = User.create(name: "Christina", username: "chsohn")
user2 = User.create(name: "Abdullah", username: "Adubz")
review = Review.create(user_id: user.id, movie_location_id: bil_loc1.id, review: "The scene was very picturesque and nice.", rating: 5)
review1 = Review.create(user_id: user.id, movie_location_id: bil_loc2.id, review: "It is a nice place to visit when the weather is nice.", rating: 4)
review3 = Review.create(user_id: user.id, movie_location_id: bil_loc3.id, review: "The backdrop is very dramatic. It's a good place for history buffs to learn about FDR.", rating: 4)
review4 = Review.create(user_id: user.id, movie_location_id: hp4_loc.id, review: "The lake definitely looks better in the movie. It is pretty quiet and nice, though.", rating: 3)



