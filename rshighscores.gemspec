# encoding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rshighscores'

Gem::Specification.new do |spec|
  spec.name          = "rshighscores"
  spec.version       = RsHighscores::VERSION
  spec.authors       = ["Sam Broughton", "Joshua Bell"]
  spec.email         = ["sam@26th-zerk.co.uk"]
  spec.description   = %q{Easy to use gem for downloading and parsing Runescape highscores} 
  spec.summary       = %q{RS Highscore Parser}
  spec.homepage      = "https://github.com/sambooo/RsHighscores"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "shoulda"
end
