# RsHighscores

[![Code Climate](https://codeclimate.com/github/sambooo/OSRSGrabber.png)](https://codeclimate.com/github/sambooo/OSRSGrabber)

Easy to use gem for downloading and parsing Runescape highscores. Inspired to some extent by [Partyhat](https://github.com/clooth/Partyhat)

This gem was previously called `osrshighscores` and only worked with Oldschool Runescape. The current version has been renamed to reflect the future version-agnostic highscore parsing that the gem will do. Currently, there is no support for Oldschool Runescape at all. Version 1.x should be used if that is required until 3.x is released.

## Installation

Add this line to your application's Gemfile:

    gem 'rshighscores'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install highscores

## Usage

```ruby
require 'rshighscores'

player = RsHighscores::Player.new "Foot"
highscores = player.stats
puts highscores.hunter.level # => 99
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
