%w(player stats comparison).each do |dep|
  require "osrshighscores/#{dep}"
end

module Osrs
  VERSION = "1.0.0"
end
