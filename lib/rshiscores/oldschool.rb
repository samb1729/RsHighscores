module RsHiscores
  module OldSchool
    class Stats < RsHiscores::Stats
      StatCount = 24
      Skills = RsHiscores::Stats::Skills.take(StatCount)
    end

    class Player < RsHiscores::Player
      LookupUrl = "http://services.runescape.com/m=hiscore_oldschool/index_lite.ws?player="
      StatClass = RsHiscores::OldSchool::Stats
    end
  end
end

module OSRS
  Player = RsHiscores::OldSchool::Player
  Stats = RsHiscores::OldSchool::Stats
end
