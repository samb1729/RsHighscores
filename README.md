# RsHighscores

[![Code Climate](https://codeclimate.com/github/sambooo/RsHighscores.png)](https://codeclimate.com/github/sambooo/RsHighscores)

Easy to use gem for downloading and parsing Runescape highscores. Inspired to some extent by [Partyhat](https://github.com/clooth/Partyhat)

## Rename and compatibility changes

This gem was previously called `osrshighscores` and only worked with Oldschool Runescape. The current version has been renamed to reflect the future version-agnostic highscore parsing that the gem will do. As of version 2.1.0, Oldschool Runescape is supported alongside Runescape 3. There are aliases in place to make code from 1.x work without issue in 2.1.x onwards, so if you were using 1.x you need not change anything.

### Why the change at all?

I was asked to port the gem to Runescape 3 by a friend. I figured it would be better to immediately roll-out a working version and then work on merging branches later.

## Installation

Add this line to your application's Gemfile:

    gem 'rshighscores'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rshighscores

## Usage

```ruby
require 'rshighscores'

foot = RsHighscores::Player.new "Foot", force: true
highscores = foot.stats
puts highscores.hunter.level # => 99

jebrim = OSRS::Player.new "Jebrim", force: true # RsHighscores::OldSchool::Player would work too
highscores = jebrim.stats
puts highscores.agility.level # => 99
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
