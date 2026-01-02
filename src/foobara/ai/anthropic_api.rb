require "net/http"
require "uri"

module Foobara
  module Ai
    foobara_organization!

    module AnthropicApi
      foobara_domain!

      class << self
        def api_token=(token)
          BaseCommand.api_token = token
        end

        def api_token
          BaseCommand.api_token
        end

        def default_llm_model
          Types::ModelEnum::CLAUDE_SONNET_4_5_20250929
        end
      end
    end
  end
end
