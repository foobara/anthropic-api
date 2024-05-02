module Foobara
  module Ai
    module AnthropicApi
      module Types
        class MessageResult < Foobara::Model
          class Usage < Foobara::Model
            attributes do
              input_tokens :integer, :required
              output_tokens :integer, :required
            end
          end
        end
      end
    end
  end
end
