require_relative "base_command"

module Foobara
  module Ai
    module AnthropicApi
      class CreateMessage < BaseCommand
        path "/messages"
        http_method :post

        add_inputs do
          system :string
          max_tokens :integer, default: 1024
          model :model_enum, default: Types::ModelEnum::CLAUDE_3_5_SONNET_20241022
          messages [Types::Message]
        end

        result Types::MessageResult

        def build_request_body
          self.request_body = { model:, max_tokens:, messages: }
        end

        def build_result
          Types::MessageResult.new(response_body, ignore_unexpected_attributes: true)
        end
      end
    end
  end
end
