# Design requirements

Current design plan. Subject to change at any time.

## Classes

All classes will be in the ```Osrs``` module.

## Typical usage

```ruby
require 'osrshighscores'

player = Osrs::Player.new "Foot"
highscores = player.stats
puts highscores[:hunter].level # => 99
```