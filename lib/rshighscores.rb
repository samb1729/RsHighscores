%w(player stats).each do |dep|
  require "rshighscores/#{dep}"
end

module RsHighscores
  VERSION = "1.0.0"
end
