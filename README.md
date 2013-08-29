# Osrshighscores

[![Code Climate](https://codeclimate.com/github/sambooo/OSRSGrabber.png)](https://codeclimate.com/github/sambooo/OSRSGrabber)

Easy to use gem for downloading and parsing Oldschool Runescape highscores. Inspired to some extent by [Partyhat](https://github.com/clooth/Partyhat)

## Installation

Add this line to your application's Gemfile:

    gem 'osrshighscores'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install osrshighscores

## Usage

```ruby
require 'osrshighscores'

player = Osrs::Player.new "Foot"
highscores = player.stats
puts highscores.hunter.level # => 99
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
