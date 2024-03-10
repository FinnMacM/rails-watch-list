require 'open-uri'
require 'json'

puts "Cleaning the database"

Bookmark.destroy_all
Movie.destroy_all

url = "https://tmdb.lewagon.com/movie/top_rated"

data_serialized = URI.open(url).read

data = JSON.parse(data_serialized)

movie_hashes = data["results"]

movie_hashes.each do |movie_hash|
  poster_url = "https://image.tmdb.org/t/p/original/#{movie_hash["poster_path"]}"
  # file = URI.open(poster_url)

  movie = Movie.new(
    title: movie_hash["original_title"],
    overview: movie_hash["overview"],
    poster_url: poster_url,
    rating: movie_hash["vote_average"]
  )
  # movie.photo.attach(io: file, filename: "#{movie_hash["original_title"].gsub(" ", "-")}.png", content_type: "image/png")
  movie.save
end
