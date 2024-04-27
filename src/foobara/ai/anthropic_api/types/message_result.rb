require_relative "model"
require_relative "role"

module Foobara
  module Ai
    module AnthropicApi
      module Types
        class MessageResult < Foobara::Model
          class Content < Foobara::Model
            attributes do
              text :string, :required
              type :string, :required, one_of: %w[text]
            end
          end

          class Usage < Foobara::Model
            attributes do
              input_tokens :integer, :required
              output_tokens :integer, :required
            end
          end

          attributes do
            content [Content]
            id :string, :required
            model :model, :required
            role :role, :required
            stop_reason :string, :required, one_of: %w[end_turn max_tokens stop_sequence]
            stop_sequence :string, :allow_nil
            type :string, :required, one_of: %w[message]
            usage Usage
          end
        end
      end
    end
  end
end
