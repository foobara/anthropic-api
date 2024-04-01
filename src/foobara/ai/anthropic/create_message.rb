module Foobara
  module Ai
    module Anthropic
      class CreateMessage < Foobara::Command
        URL = "https://api.anthropic.com/v1/messages".freeze

        inputs do
          # TODO: come up with some kind of execution context object to wrap all of these calls upon which
          # data wrapping a "request" can live instead of being passed around?
          api_token :string
          # TODO: extract this list into a foobara type
          system :string
          max_tokens :integer, default: 1024
          model :model, default: Types::ModelEnum::CLAUDE_3_OPUS
          messages [Types::Message]
        end

        result Types::MessageResult

        def execute
          build_request_body
          build_request_headers
          issue_http_request
          parse_response
          build_message_result

          message_result
        end

        attr_accessor :request_body, :request_headers, :response, :response_body, :message_result

        def build_request_body
          self.request_body = { model:, max_tokens:, messages: }
        end

        def build_request_headers
          self.request_headers = {
            "Content-Type" => "application/json",
            "X-Api-Key" => api_token,
            "Anthropic-Version" => "2023-06-01"
          }
        end

        def api_token
          inputs[:api_token] || ENV.fetch("ANTHROPIC_API_KEY", nil)
        end

        def issue_http_request
          url = URI.parse(URL)
          self.response = Net::HTTP.post(url, JSON.generate(request_body), request_headers)
        end

        def parse_response
          json = if response.is_a?(Net::HTTPSuccess)
                   response.body
                 else
                   # :nocov:
                   raise "Could not get message result from #{URL}: " \
                         "#{response.code} #{response.message}"
                   # :nocov:
                 end

          self.response_body = JSON.parse(json)
        end

        def build_message_result
          self.message_result = Types::MessageResult.new(response_body)
        end
      end
    end
  end
end
