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
          temperature :float
        end

        result Types::MessageResult

        def build_request_body
          body = { model:, max_tokens:, messages: }

          temp = inputs[:temperature]
          if temp
            body[:temperature] = temp
          end

          sys = inputs[:system]
          if sys
            body[:system] = sys
          end

          self.request_body = body
        end

        def build_result
          Types::MessageResult.new(response_body, ignore_unexpected_attributes: true)
        end
      end
    end
  end
end
