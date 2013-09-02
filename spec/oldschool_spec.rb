require 'spec_helper'

describe RsHighscores::OldSchool::Player do
  it "namespace alias" do
    OSRS::Player.should eq(RsHighscores::OldSchool::Player)
  end
end