require 'spec_helper'

describe Osrs::Stats do
  player = Osrs::Player.new "jebrim"
  player.fetch_highscores

  describe "raw highscore validation" do
    context "valid input" do
      it "correct input length" do
        lambda {
          stats = Osrs::Stats.new player.raw_stats
        }.should_not raise_error
      end
    end

    context "invalid input" do
      it "incorrect input length" do
        lambda {
          Osrs::Stats.new []
        }.should raise_error("incorrect input length")
      end

      it "malformed input line" do
        lambda {
          Osrs::Stats.new Array.new(39) { "" }
        }.should raise_error("malformed raw stats")
      end
    end
  end

  describe "stat parsing" do
    stats = Osrs::Stats.new player.raw_stats

    it "parsed output length" do
      stats.stats.length.should eq(24)
    end

    it "stats in groups of three" do
      stats.stats.each do |skill|
        skill.length.should eq(3)
      end
    end

    it "stats converted to ints" do
      stats.stats.each do |skill|
        skill.each do |elem|
          elem.should be_a(Numeric)
        end
      end
    end
  end
end