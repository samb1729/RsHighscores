module Osrs
  class Stats
    attr_reader :raw_stats

    def initialize raw_stats
      @raw_stats = raw_stats
      validate_raw_stats
    end

    def validate_raw_stats
      raise "incorrect input length" unless @raw_stats.length == 39
    end
  end
end