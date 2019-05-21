class Artist
    attr_accessor :name

    @@all = []

    def initialize(name)
        @name = name
        self.save
    end

    def songs
        Song.all.select do |each_song|
            each_song.artist == self
        end
    end

    def save
        self.class.all << self
    end

    def self.all
        @@all
    end

    def add_song(song)
        song.artist = self
    end

    def self.find_or_create_by_name(artist_name)
        needed_artist = self.all.find {|artist| artist.name == artist_name}
        if needed_artist == nil
            needed_artist = Artist.new(artist_name)
        end
        needed_artist
    end

    def print_songs
        self.songs.each {|each_song| puts each_song.name}
    end

end