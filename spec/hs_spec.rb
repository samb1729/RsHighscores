require 'spec_helper'
describe Osrshighscores do
		describe "#score" do
				it "returns 0 for all lookup" do
						lookup = Osrshighscores.new
						lambda { 1.time { lookup.total("Jebrim") } }
						lookup.total.should == 2150
				end
		end
end
