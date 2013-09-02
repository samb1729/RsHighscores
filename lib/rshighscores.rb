%w(player stats oldschool).each do |dep|
  require "rshighscores/#{dep}"
end

module RsHighscores
  VERSION = "2.0.1"
end

module OSRS
  # This exists for compatibility reasons
end
