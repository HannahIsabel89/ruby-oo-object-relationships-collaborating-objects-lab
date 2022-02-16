# The Artist class will be responsible for either creating the artist (if the artist doesn't exist in our program yet) or finding the instance of that artist (if the artist does exist).
class Artist
    attr_accessor :name
    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    #This class method should return all Artist instances.
    def self.all
        @@all
    end

    #This instance method returns an Array of all songs that belong to this Artist instance. This method should get all existing Song instances from Song and select only the ones that are associated with this Artist instance.
    def songs
        Song.all.filter {|song| song.artist == self}
    end

    #This instance method exists to tell a passed in Song instance it belongs to this Artist instance. keeps track of an artist's songs
    def add_song(song)
        song.artist_name = self.name
    end

    #This class method should take the name that is passed in (remember, it will be a string), and do one of two things: find the artist instance that has that name or create one if it doesn't exist. Either way, the return value of the method will be an instance of an artist with the name attribute filled out.
    def self.find_or_create_by_name(name)
        all.find{|artist| artist.name == name} || self.new(name)
        #logical or operator.  do this or that
    end

    # lists all of the artist's songs
    def print_songs
        songs.each {|song| puts song.name}
    end
end
