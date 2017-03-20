# coding: utf-8

lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "jekyll/series/version"

Gem::Specification.new do |spec|
  spec.name                  = "jekyll-series"
  spec.version               = Jekyll::Series::VERSION
  spec.authors               = ["Torgny Bjers"]
  spec.email                 = ["torgny.bjers@gmail.com"]

  spec.summary               = "Jekyll article series list tag"
  spec.description           = "Generates an article series list from Markdown front-matter."
  spec.homepage              = "https://github.com/tbjers/jekyll-series-plugin"
  spec.license               = "MIT"
  spec.required_ruby_version = ">= 2.0.0"

  spec.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.14"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "rubocop", "~> 0.47.1"
  spec.add_development_dependency "byebug" if RUBY_VERSION >= "2.0"
end
