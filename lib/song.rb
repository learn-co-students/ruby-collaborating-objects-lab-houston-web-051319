class Song
    attr_accessor :name, :artist
    @@all = []

    def initialize(name)
        @name = name
        self.class.all << self
    end

    def self.all
        @@all
    end

    def self.new_by_filename(file_name)
        file_name.chomp!(".mp3")
        file_split = file_name.split(" - ")
        new_song = Song.new(file_split[1])
        new_song.artist = Artist.find_or_create_by_name(file_split[0])
        new_song
    end

end