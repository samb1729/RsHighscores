%w(stats player oldschool).each do |dep|
  require "rshighscores/#{dep}"
end

module RsHighscores
  VERSION = "2.1.3"
end

module OSRS
  # This exists for compatibility reasons
end
