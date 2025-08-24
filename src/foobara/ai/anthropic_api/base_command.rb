require "foobara/http_api_command"

module Foobara
  module Ai
    module AnthropicApi
      class BaseCommand < Foobara::Command
        abstract

        class << self
          attr_accessor :api_token
        end

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
          inputs[:api_token] || BaseCommand.api_token || api_token_from_env
        end

        def api_token_from_env
          ENV.fetch("ANTHROPIC_API_KEY", nil)
        end

        def anthropic_version
          inputs[:anthropic_version] || ENV.fetch("ANTHROPIC_VERSION", "2023-06-01")
        end

        def issue_http_request(failures = 0)
          super()

          return if failures > 6

          case response.code
          when "429"
            # TODO: figure out how to test this code path
            # :nocov:
            sleep 2 ** failures
            issue_http_request(failures + 1)
            # :nocov:
          when "529"
            # :nocov:
            failures += 1
            sleep failures
            issue_http_request(failures)
            # :nocov:
          end
        end
      end
    end
  end
end
