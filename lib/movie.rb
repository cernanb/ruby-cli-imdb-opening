class Movie
    attr_accessor :title, :url, :rating, :runtime, :summary
    @@all = []

    def initialize(title, url)
        @title = title
        @url = url
    end

    def save
        @@all << self
    end

    def self.all 
        @@all
    end

end