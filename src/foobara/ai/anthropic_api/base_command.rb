require "foobara/http_api_command"

module Foobara
  module Ai
    module AnthropicApi
      class BaseCommand < Foobara::Command
        include HttpApiCommand

        base_url "https://api.anthropic.com/v1"

        inputs do
          api_token :string
          anthropic_version :string
        end

        def build_request_headers
          self.request_headers = {
            "Content-Type" => "application/json",
            "X-Api-Key" => api_token,
            "Anthropic-Version" => anthropic_version
          }
        end

        def api_token
          inputs[:api_token] || ENV.fetch("ANTHROPIC_API_KEY", nil)
        end

        def anthropic_version
          inputs[:anthropic_version] || ENV.fetch("ANTHROPIC_VERSION", "2023-06-01")
        end
      end
    end
  end
end
