require 'open-uri'

module RsHighscores
  class Player
    LookupUrl = "http://hiscore.runescape.com/index_lite.ws?player="
    StatClass = RsHighscores::Stats

    attr_reader :name, :raw_stats, :stats

    def initialize name, params = {}
      @name = name
      validate_name

      fetch_highscores if params[:force]
    end

    def validate_name
      raise "invalid characters in name" if @name =~ /[^A-Za-z0-9_\- ]/

      raise "name too long" if @name.length > 12
      raise "name too short" if @name.length < 1

      raise "name starts/ends with a space character" if (name[0] + name[-1]) =~ /[_\- ]/
    end

    def fetch_highscores
      safe_name = @name.gsub " ", "%20"
      f = open(self.class::LookupUrl + safe_name, "User-Agent" => "Ruby/RsHighscoresGrabber")
      
      @raw_stats = f.readlines.map &:chomp # readlines preserves newlines??
      @stats = self.class::StatClass.new @raw_stats
    end
  end
end
