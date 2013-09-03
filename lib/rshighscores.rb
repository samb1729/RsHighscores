%w(stats player oldschool).each do |dep|
  require "rshighscores/#{dep}"
end

module RsHighscores
  VERSION = "2.1.0"
end

module OSRS
  # This exists for compatibility reasons
end
