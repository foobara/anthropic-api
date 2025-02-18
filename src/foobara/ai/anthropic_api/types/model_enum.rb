module Foobara
  module Ai
    module AnthropicApi
      module Types
        # Can grab an updated list by running something like:
        #
        # > require "foobara/anthropic_api"
        # > Foobara::Ai::AnthropicApi.api_token = File.read("tokens/anthropic_token.txt") and nil
        # > Foobara::Ai::AnthropicApi::ListModels.run!.map(&:id).sort
        # => [
        #  "claude-2.0",
        #  "claude-2.1",
        #  "claude-3-5-haiku-20241022",
        #  "claude-3-5-sonnet-20240620",
        #  "claude-3-5-sonnet-20241022",
        #  "claude-3-haiku-20240307",
        #  "claude-3-opus-20240229",
        #  "claude-3-sonnet-20240229"
        # ]
        ModelEnum = Foobara::Enumerated.make_module(
          "claude-2.0",
          "claude-2.1",
          "claude-3-5-haiku-20241022",
          "claude-3-5-sonnet-20240620",
          "claude-3-5-sonnet-20241022",
          "claude-3-haiku-20240307",
          "claude-3-opus-20240229",
          "claude-3-sonnet-20240229"
        )

        AnthropicApi.foobara_register_type(:model, :string, one_of: ModelEnum)
      end
    end
  end
end
