require "vcr"

VCR.configure do |config|
  config.filter_sensitive_data("<ANTHROPIC_API_KEY>") { ENV.fetch("ANTHROPIC_API_KEY", nil) }

  config.before_record do |interaction|
    if interaction.request.headers["Cookie"]
      interaction.request.headers["Cookie"] = ["<SCRUBBED>"]
    end
    if interaction.response.headers["Set-Cookie"]
      interaction.response.headers["Set-Cookie"] = ["<SCRUBBED>"]
    end
  end

  config.cassette_library_dir = "spec/vcr_cassettes"
  config.hook_into :webmock
  config.configure_rspec_metadata!
end
