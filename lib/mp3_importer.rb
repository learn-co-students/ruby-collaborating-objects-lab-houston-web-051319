class MP3Importer
    attr_reader :path

    def initialize(path)
        @path = path
    end

    def files
        files = Dir.entries(self.path)
        files.shift(2)
        files
    end

    def import
        needed_files = self.files
        needed_files.each do |each_file|
            Song.new_by_filename(each_file)
        end
    end

end