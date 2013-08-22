module Osrs
  class Stats
    attr_accessor :stats

    @@skills = %w(Overall Attack Defence Strength
                  Hitpoints Ranged Prayer Magic
                  Cooking Woodcutting Fletching Fishing
                  Firemaking Crafting Smithing Mining
                  Herblore Agility Thieving Slayer
                  Farming Runecrafting Hunter Construction)

    def initialize raw_stats
      @raw_stats = raw_stats
      parse_stats
    end

    def parse_stats
      validate_raw_stats

      @stats = []
      @raw_stats.take(24).each do |line|
        raise "malformed raw stats" unless line =~ /\d+,\d+,\d+/
        @stats << []
      end
    end

    def validate_raw_stats
      raise "incorrect input length" unless @raw_stats.length == 39
    end
  end
end