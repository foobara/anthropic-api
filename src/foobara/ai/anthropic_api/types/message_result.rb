require_relative "model_enum"
require_relative "role"

module Foobara
  module Ai
    module AnthropicApi
      module Types
        class MessageResult < Foobara::Model
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
