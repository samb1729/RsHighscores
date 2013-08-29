require 'spec_helper'

describe RsHighscores::Stats do
  before :all do
    @player = RsHighscores::Player.new "jake", :force
    @stats = RsHighscores::Stats.new @player.raw_stats
  end

  describe "raw highscore validation" do
    context "valid input" do
      it "correct input length" do
        lambda {
         @stats = RsHighscores::Stats.new @player.raw_stats
        }.should_not raise_error
      end
    end

    context "invalid input" do
      it "incorrect input length" do
        lambda {
          RsHighscores::Stats.new []
        }.should raise_error("incorrect input length")
      end

      it "malformed input line" do
        lambda {
          RsHighscores::Stats.new Array.new(44) { "" }
        }.should raise_error("malformed raw stats")
      end
    end
  end

  describe "stat parsing" do
    it "parsed output length" do
     @stats.stats.length.should eq(@stats.skill_names.count)
    end

    it "stats in groups of three" do
     @stats.stats.each do |skill|
        skill.length.should eq(3)
      end
    end

    it "stats converted to ints" do
     @stats.stats.each do |skill|
        skill.each do |elem|
          elem.should be_a(Numeric)
        end
      end
    end
  end

  describe "usability" do
    it "stats 'hash' call" do
      lambda {
       @stats[:overall]
      }.should_not raise_error
    end

    it "stat arrays with convenience methods" do
     @stats.stats.each do |skill|
        skill.rank.should be_a(Numeric)
        skill.level.should be_a(Numeric)
        skill.xp.should be_a(Numeric)
      end
    end

    it "error on non-existant skill lookup" do
      lambda {
       @stats[:foot]
      }.should raise_error("non-existant skill lookup")
    end

    it "success on valid skill lookup" do
      @stats.skill_names.each do |name|
        @stats[name].should be_a(Array)
      end
    end

    it "skill_names output" do
      @stats.skill_names.should eq(%w(Overall Attack Defence Strength
                                      Hitpoints Ranged Prayer Magic
                                      Cooking Woodcutting Fletching Fishing
                                      Firemaking Crafting Smithing Mining
                                      Herblore Agility Thieving Slayer
                                      Farming Runecrafting Hunter Construction
                                      Summoning Dungeoneering Divination))
    end

    it "missing method call" do
      @stats.skill_names.each do |name|
        @stats.send(name).should eq(@stats[name])
      end
    end
  end
end
