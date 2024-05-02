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
        end
      end
    end
  end
end
