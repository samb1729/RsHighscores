require 'spec_helper'

describe Osrs::Player do
		describe "name validation" do
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
		end
end
