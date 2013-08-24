require 'open-uri'

module Osrs
  class Player
    @@lookup_url = "http://services.runescape.com/m=hiscore_oldschool/index_lite.ws?player="

    attr_reader :name, :raw_stats, :stats

    def initialize name, force = :no_force
      @name = name
      validate_name

      fetch_highscores if force == :force
    end

    def validate_name
      raise "invalid characters in name" if @name =~ /[^A-Za-z0-9_\- ]/

      raise "name too long" if @name.length > 12
      raise "name too short" if @name.length < 1

      raise "name starts/ends with a space character" if (name[0] + name[-1]) =~ /[_\- ]/
    end

    def fetch_highscores
      f = open(@@lookup_url + @name, "User-Agent" => "Ruby/OSRSGrabber")
      
      @raw_stats = f.readlines.map &:chomp # Readlines preserves newlines??
      @stats = Osrs::Stats.new @raw_stats
    end
  end
end
