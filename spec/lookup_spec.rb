require 'spec_helper'

describe Osrs::Stats do
  player = Osrs::Player.new "jebrim", :force
  stats = Osrs::Stats.new player.raw_stats

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

  describe "usability" do
    it "stats 'hash' call" do
      lambda {
        stats[:overall]
      }.should_not raise_error
    end

    it "stat arrays with convenience methods" do
      stats.stats.each do |skill|
        skill.rank.should be_a(Numeric)
        skill.level.should be_a(Numeric)
        skill.xp.should be_a(Numeric)
      end
    end

    it "error on non-existant skill lookup" do
      lambda {
        stats[:foot]
      }.should raise_error("non-existant skill lookup")
    end

    it "success on valid skill lookup" do
      stats.skill_names.each do |name|
        stats[name].should be_a(Array)
      end
    end

    it "missing method call" do
      stats.skill_names.each do |name|
        stats.send(name.to_sym).should eq(stats[name])
      end
    end
  end
end
