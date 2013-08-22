require 'spec_helper'

describe Osrs::Player do
	describe "name validation" do
    context "valid names" do
      it "ordinary name" do
        lambda {
          Osrs::Player.new "foot"
        }.should_not raise_error
      end

      it "multiple spaces" do
        lambda {
          Osrs::Player.new "s u  o  m i"
        }.should_not raise_error
      end
    end
    
    context "errors" do
      it "invalid characters in name" do
        lambda {
          Osrs::Player.new "@£$%^&"
        }.should raise_error(Exception, "invalid characters in name")
      end

      it "name too long" do
        lambda {
          Osrs::Player.new "abcdef123456x"
        }.should raise_error(Exception, "name too long")
      end

      it "name too short" do
        lambda {
          Osrs::Player.new ""
        }.should raise_error(Exception, "name too short")
      end

      it "name starts/ends with space character" do
        lambda {
          Osrs::Player.new "_heh_"
        }.should raise_error(Exception, "name starts/ends with a space character")
      end
    end
	end

  describe "highscore lookup" do
    it "member lookup" do
      player = Osrs::Player.new "jebrim" # Not Foot in case he cancels membership
      lambda {
        player.fetch_highscores
      }.should_not raise_error

      player.raw_stats.should_not be_nil
      player.raw_stats.length.should_not eq(0)
      player.raw_stats.each { |e| e.end_with?("\n").should be_false }
    end

    it "non-member/banned lookup" do
      player = Osrs::Player.new "smithking087" # Known banned player
      lambda {
        player.fetch_highscores
      }.should raise_error(OpenURI::HTTPError)
    end
  end
end
