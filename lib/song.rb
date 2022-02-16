# The Song class will be responsible for creating songs given each filename and sending the artist's name (a string) to the Artist class
class Song 
    attr_accessor :name, :artist
    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def self.new_by_filename(filename)
        name = filename.split(" - ")[1].split(".mp3")[0]
        artist = filename.split(" - ")[0]
        song = self.new(name)
        song.artist_name = artist   #setter method use as if you use an attribute - set it using equals sign
        song
    end

    def artist_name=(name)  #setter method can use equal sign operator in line 18
        self.artist = Artist.find_or_create_by_name(name)
    end

end