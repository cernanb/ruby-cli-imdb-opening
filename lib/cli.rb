
require 'pry'

class CLI

    def run
        puts "Welcome to IMDB Opening!"
        puts "Here are the movies opening this week"
        Scraper.scrape_imdb
        display_opening_movies
        menu
    end


    def display_opening_movies
         Movie.all.each.with_index(1) do |movie, i|
            
            puts "#{i}. #{movie.title}"
        end
    end

    def menu
        puts "Please select a movie to display it's details"
        input = gets.chomp

        movie = Movie.all[input.to_i - 1]

        if !movie 
            puts "Bad selection"
            menu
        else
            Scraper.scrape_movie_details(movie)
            puts "Here are the details for #{movie.title}:"
            puts "Rating: #{movie.rating}"
            puts "Runtime: #{movie.runtime}"
            puts "Summary: #{movie.summary}"
            menu
        end
    end
end