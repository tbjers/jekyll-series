$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)

require "bundler/setup"
require "support/jekyll_template"
require "jekyll/series"
require "byebug" if RUBY_VERSION >= "2.0"

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
