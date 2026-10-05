require_relative "get_model"

module Foobara
  module Ai
    module AnthropicApi
      class CreateMessage < BaseCommand
        path "/messages"
        http_method :post

        add_inputs do
          system :string
          max_tokens :integer, :allow_nil, "nil means whatever the max allowed is.", default: nil
          model :model_enum, default: AnthropicApi.default_llm_model
          messages [Types::Message]
          # TODO: maybe this shouldn't be supported here?? It's not really part of this API.
          # Maybe relocate this to Foobara::Ai instead.
          fail_if_hitting_token_limit :boolean, default: false
        end

        result Types::MessageResult

        possible_error :hit_token_limit, context: { model: :model_enum, max_tokens: :integer }

        depends_on GetModel

        def build_request_body
          body = { model:, max_tokens:, messages: }

          sys = inputs[:system]
          if sys
            body[:system] = sys
          end

          self.request_body = body
        end

        def max_tokens
          @max_tokens ||= inputs[:max_tokens] ||
                          run_subcommand!(GetModel, model:).max_tokens ||
                          64_000
        end

        def build_result
          message_result = Types::MessageResult.new(
            response_body,
            # Set this to false to discover new attributes
            ignore_unexpected_attributes: true
          )

          if fail_if_hitting_token_limit && message_result.hit_max_tokens?
            add_runtime_error(:hit_token_limit, model:, max_tokens:)
          end

          message_result
        end
      end
    end
  end
end
