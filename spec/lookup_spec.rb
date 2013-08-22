require 'spec_helper'

describe Osrs::Stats do
  describe "raw highscore validation" do
    context "valid input" do
      it "correct input length" do
        player = Osrs::Player.new "jebrim"
        player.fetch_highscores
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
    end
  end
end