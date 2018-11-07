require 'open-uri'
require 'nokogiri'

class Scraper

    IMDB_URL = "https://www.imdb.com/"

    def self.scrape_imdb

        html = open(IMDB_URL)
        doc = Nokogiri::HTML(html)
        doc.css(".rhs-body")[0].css(".rhs-row").each do |mov_el|
            title = mov_el.css(".title").text.strip
            url = mov_el.css(".title a").attr("href").value
            movie = Movie.new(title, url)
            movie.save
        end

    end

    def self.scrape_movie_details(movie)
        html = open(IMDB_URL + movie.url)
        doc = Nokogiri::HTML(html)
        movie.rating = doc.css(".subtext").text.split("\n")[1].strip
        movie.runtime = doc.css(".subtext").text.split("\n")[3].strip
        movie.summary = doc.css(".summary_text").text.strip
        
    end
end