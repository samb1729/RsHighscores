require 'spec_helper'

describe Osrs::Player do
		describe "name validation" do
      it "error on invalid characters" do
        lambda { Osrs::Player.new "@£$%^&" }.should raise_error
      end
		end
end
