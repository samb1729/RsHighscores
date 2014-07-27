%w(stats player oldschool).each do |dep|
  require "rshiscores/#{dep}"
end

module RsHiscores
  VERSION = "3.0.0"
end

module OSRS
end
