%w(stats player oldschool).each do |dep|
  require "rshiscores/#{dep}"
end

module RsHiscores
  VERSION = "2.2.1"
end

module OSRS
end
