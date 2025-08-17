require_relative "version"

source "https://rubygems.org"
ruby Foobara::AnthropicApi::MINIMUM_RUBY_VERSION

gemspec

gem "foobara", path: "#{__dir__}/../foobara"
gem "foobara-auth", path: "#{__dir__}/../auth"
gem "foobara-auth-http", path: "#{__dir__}/../auth-http"
gem "foobara-http-command-connector", path: "#{__dir__}/../http-command-connector"
gem "foobara-rack-connector", path: "#{__dir__}/../rack-connector"

gem "foobara-dotenv-loader", "< 2.0.0"

gem "rake"

group :development do
  gem "foobara-rubocop-rules", ">= 1.0.0"
  gem "guard-rspec"
  gem "rubocop-rake"
  gem "rubocop-rspec"
end

group :development, :test do
  gem "pry"
  gem "pry-byebug"
end

group :test do
  gem "foobara-spec-helpers", "< 2.0.0"
  gem "rspec"
  gem "rspec-its"
  gem "ruby-prof"
  gem "simplecov"
  gem "vcr"
  gem "webmock"
end
