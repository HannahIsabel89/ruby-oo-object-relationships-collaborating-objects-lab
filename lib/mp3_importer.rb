# The MP3Importer class will parse all the filenames in the spec/fixtures folder and send the filenames to the Song class
class MP3Importer
    attr_accessor :path

    def initialize(path)
        self.path = path
    end

    # hint to use built in Dir class - has methods 
    def files 
        Dir.glob("#{path}/*.mp3").collect {|fname| fname.gsub("#{path}/", "")}
        #remember that Ruby cares about ' and ""  need to use double 
    end

    def import #relied on files method - that is there the filenames come from
        files.each {|fname| Song.new_by_filename(fname)}
    end
end