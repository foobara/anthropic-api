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
          :"claude-3-7-sonnet-20250219"
        end
      end
    end
  end
end
