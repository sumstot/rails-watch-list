
require 'open-uri'
Movie.destroy_all
# List.destroy_all
puts 'Seeding database'
# the Le Wagon copy of the API
url = 'http://tmdb.lewagon.com/movie/top_rated'
response = JSON.parse(URI.open(url).read)

response['results'].each do |movie_hash|
  puts
  p movie_hash

  Movie.create!(
    title: movie_hash['original_title'],
    overview: movie_hash['overview'],
    poster_url: "https://image.tmdb.org/t/p/w500" + movie_hash['poster_path']
  )
end

puts "Seeded DB with #{Movie.all.count} movies"
