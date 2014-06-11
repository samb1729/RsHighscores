module RsHighscores
  module OldSchool
    class Stats < RsHighscores::Stats
      Skills = RsHighscores::Stats::Skills.take(24)

      ExpectedStatCount = 24
      ActualStatCount = 24
    end

    class Player < RsHighscores::Player
      LookupUrl = "http://services.runescape.com/m=hiscore_oldschool/index_lite.ws?player="
      StatClass = RsHighscores::OldSchool::Stats
    end
  end
end

module OSRS
  Player = RsHighscores::OldSchool::Player
  Stats = RsHighscores::OldSchool::Stats
end
