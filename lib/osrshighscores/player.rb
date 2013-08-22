require 'open-uri'

module Osrs
  class Player
    @@lookup_url = "http://services.runescape.com/m=hiscore_oldschool/index_lite.ws?player="

    attr_reader :name, :raw_stats

    def initialize name
      @name = name

      validate_name
    end

    def validate_name
      raise "invalid characters in name" if @name =~ /[^A-Za-z0-9_\- ]/

      raise "name too long" if @name.length > 12
      raise "name too short" if @name.length < 1

      raise "name starts/ends with a space character" if (name[0] + name[-1]) =~ /[_\- ]/
    end

    def fetch_hiscores
      open(@@lookup_url + @name, "User-Agent" => "Ruby/OSRSGrabber") do |f|
        @raw_stats = f.readlines
      end
    end
  end
end
