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
            model :model_enum, :required
            role :role, :required
            stop_reason :string, :required, one_of: ["end_turn", "max_tokens", "stop_sequence"]
            stop_sequence :string, :allow_nil
            type :string, :required, one_of: ["message"]
            usage Usage

            # TODO: type this, no clue what it is (but it can definitely be null)
            stop_details :duck
            # TODO: type this, no clue what it is (but it can definitely be null)
            container :duck
          end
        end
      end
    end
  end
end
