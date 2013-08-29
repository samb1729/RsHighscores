%w(player stats).each do |dep|
  require "rshighscores/#{dep}"
end

module RsHighscores
  VERSION = "2.0.1"
end
