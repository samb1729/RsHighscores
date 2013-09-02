module RsHighscores
  module OldSchool
    class Player < RsHighscores::Player
      def fetch_highscores
        f = open("http://services.runescape.com/m=hiscore_oldschool/index_lite.ws?player=" + @name, "User-Agent" => "Ruby/RsHighscoresGrabber")
        
        @raw_stats = f.readlines.map &:chomp # readlines preserves newlines??
        @stats = RsHighscores::OldSchool::Stats.new @raw_stats
      end
    end

    class Stats < RsHighscores::Stats
      Skills = %w(Overall Attack Defence Strength
                  Hitpoints Ranged Prayer Magic
                  Cooking Woodcutting Fletching Fishing
                  Firemaking Crafting Smithing Mining
                  Herblore Agility Thieving Slayer
                  Farming Runecrafting Hunter Construction)

      ExpectedStatCount = 39
      ActualStatCount = 23

      def validate_raw_stats
        raise "incorrect input length" unless @raw_stats.length == ExpectedStatCount
      end

      def parse_stats
      validate_raw_stats

      @stats = []
      @raw_stats.take(ActualStatCount).each do |line|
        raise "malformed raw stats" unless line =~ /\d+,\d+,\d+/
        stat = line.split(",").map(&:to_i)

        class << stat
          def method_missing name, *args
            case name
            when :rank
              return self[0]
            when :level
              return self[1]
            when :xp
              return self[2]
            end
          end
        end

        @stats << stat
      end
    end
    end
  end
end

module OSRS
  Player = RsHighscores::OldSchool::Player
  Stats = RsHighscores::OldSchool::Stats
end
