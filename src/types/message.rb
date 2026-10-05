module Foobara
  module Ai
    module AnthropicApi
      module Types
        class Message < Foobara::Model
          attributes do
            role :string, one_of: ["assistant", "user"]
            content :string
          end
        end
      end
    end
  end
end
