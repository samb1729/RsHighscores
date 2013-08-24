module Osrs
  class Stats
    attr_accessor :stats, :raw_stats, :created_at

    @@skills = %w(Overall Attack Defence Strength
                  Hitpoints Ranged Prayer Magic
                  Cooking Woodcutting Fletching Fishing
                  Firemaking Crafting Smithing Mining
                  Herblore Agility Thieving Slayer
                  Farming Runecrafting Hunter Construction)

    def initialize raw_stats
      @raw_stats = raw_stats
      @created_at = Time.now

      parse_stats
    end

    def validate_raw_stats
      raise "incorrect input length" unless @raw_stats.length == 39
    end

    def parse_stats
      validate_raw_stats

      @stats = []
      @raw_stats.take(24).each do |line|
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

    def skill_names
      @@skills
    end

    def [] skill
      skill = skill.to_s.capitalize
      raise "non-existant skill lookup" unless @@skills.index(skill)

      stats[@@skills.index(skill)]
    end
  end
end