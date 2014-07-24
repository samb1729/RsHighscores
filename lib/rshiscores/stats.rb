module RsHiscores
  class Stats
    Skills = %w(Overall Attack Defence Strength
                Hitpoints Ranged Prayer Magic
                Cooking Woodcutting Fletching Fishing
                Firemaking Crafting Smithing Mining
                Herblore Agility Thieving Slayer
                Farming Runecrafting Hunter Construction
                Summoning Dungeoneering Divination)

    StatCount = Skills.count

    attr_accessor :stats, :raw_stats

    def initialize raw_stats
      @raw_stats = raw_stats

      parse_stats
    end

    def stat_count
      self.class::StatCount
    end

    def skills
      self.class::Skills
    end

    def validate_raw_stats
      if @raw_stats.length < stat_count
        raise "incorrect input length: expected #{stat_count}, got #{@raw_stats.length}"
      end
    end

    def parse_stats
      validate_raw_stats

      @stats = []
      @raw_stats.take(stat_count).each do |line|
        raise "malformed raw stats" unless line =~ /\d+,\d+,\d+/
        stat = Stat.new line.split(",").map(&:to_i)

        @stats << stat
      end
    end

    def [] skill
      skill = skill.to_s.capitalize
      raise "non-existant skill lookup" unless skills.index(skill)

      stats[skills.index(skill)]
    end

    def method_missing name, *args
      return self[name] if Skills.include? name.to_s.capitalize
      super
    end
  end

  class Stat
    attr_reader :backing_array

    def initialize backing_array
      @backing_array = backing_array
    end

    def length
      backing_array.length
    end

    def each &block
      backing_array.each &block
    end

    def rank
      backing_array[0]
    end

    def level
      backing_array[1]
    end

    def xp
      backing_array[2]
    end
  end
end
