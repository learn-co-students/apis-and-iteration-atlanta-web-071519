require 'rest-client'
require 'json'
require 'pry'

ef get_character_movies_from_api(character_name)
    #make the web request
    response = RestClient.get('http://www.swapi.co/api/people/')
    response_hash = JSON.parse(response.body)
  
    # iterate over the response hash to find the collection of `films` for the given
    #   `character`
    # collect those film API urls, make a web request to each URL to get the info
    #  for that film
    # return value of this method should be collection of info about each film.
    #  i.e. an array of hashes in which each hash reps a given film
    # this collection will be the argument given to `print_movies`
    #  and that method will do some nice presentation stuff like puts out a list
    #  of movies by title. Have a play around with the puts with other info about a given film.

    size = response_hash["results"].size
    movie_info = []

    size.times do |i|
        if(response_hash["results"][i]["name"].downcase == character_name.downcase)
            movie_info = response_hash["results"][i]["films"]
        end
    end

    size2 = movie_info.size 
    temp = []
    size2.times do |i|
        temp.push(JSON.parse(RestClient.get(movie_info[i]).body)["title"])
    end
    return temp
  end

  
  def print_movies(films)
    # some iteration magic and puts out the movies in a nice list
    puts "---------"
    for i in films do 
        puts i 
    end
  end
  
  def show_character_movies(character)
    films_array = get_character_movies_from_api(character)
    print_movies(films_array)
  end

 
