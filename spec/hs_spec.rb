require 'spec_helper'
describe Highscores do
		describe "#score" do
				it "returns 0 for all lookup" do
						lookup = Highscore.new
						lambda { 1.time { lookup.total("Jebrim") } }
						lookup.total.should == 2150
				end
		end
end
