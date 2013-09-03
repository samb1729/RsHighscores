require 'spec_helper'

describe RsHighscores::OldSchool::Player do
  context "backwards compatibility" do
    it "namespace alias" do
      OSRS::Player.should eq(RsHighscores::OldSchool::Player)
    end
  end

  context "usability" do
    before :all do
      @player = OSRS::Player.new "jebrim", :force
      @stats = OSRS::Stats.new @player.raw_stats
    end

    it "skill_names output" do
      OSRS::Stats::Skills.should eq(%w(Overall Attack Defence Strength
                                      Hitpoints Ranged Prayer Magic
                                      Cooking Woodcutting Fletching Fishing
                                      Firemaking Crafting Smithing Mining
                                      Herblore Agility Thieving Slayer
                                      Farming Runecrafting Hunter Construction))
    end

    it "individual skill lookup" do
      @stats.stats.each do |stat|
        stat.should be_a(Array)
        stat.each do |elem|
          elem.should be_a(Numeric)
        end
      end
    end

    it "named stat lookup" do
      OSRS::Stats::Skills.each do |skill|
        @stats.send(skill.to_sym).should be_a(Array)
      end
    end
  end
end
