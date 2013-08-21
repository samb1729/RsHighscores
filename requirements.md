# Design requirements

Current design plan. Subject to change at any time.

## Classes

All classes will be in the ```Osrshighscores``` module.

## Typical usage

```ruby
require 'osrshighscores'

player = Osrshighscores::Player.new "Foot"
highscores = player.fetch_stats
puts highscores[:hunter].level # => 99
```