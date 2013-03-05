# -*- encoding: utf-8 -*-
require File.expand_path('../lib/dotify/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Matt Bridges"]
  gem.email         = ["mbridges.91@gmail.com"]
  gem.description   = %q{A App Tool for managing your dotfiles}
  gem.summary       = %q{A App Tool for managing your dotfiles}
  gem.homepage      = "https://github.com/mattdbridges/dotify"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "dotify"
  gem.require_paths = ["lib"]
  gem.version       = Dotify::VERSION

  gem.add_runtime_dependency "thor", "~> 0.17.0"
  gem.add_runtime_dependency "multi_json", "~> 1.6.1"
  gem.add_runtime_dependency "git", "~> 1.2.5"

  gem.add_development_dependency 'rspec', '~> 2.13.0'
  gem.add_development_dependency 'webmock'
  # gem.add_development_dependency 'cucumber'
  # gem.add_development_dependency 'aruba'
end
