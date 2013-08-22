require 'spec_helper'

describe Osrs::Stats do
  describe "raw highscore validation" do
    it "valid input" do
      player = Osrs::Player.new "jebrim"
      player.fetch_highscores
    end
  end
end