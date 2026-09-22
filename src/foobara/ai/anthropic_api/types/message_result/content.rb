module Foobara
  module Ai
    module AnthropicApi
      module Types
        class MessageResult < Foobara::Model
          class Content < Foobara::Model
            # TODO: we either need to support inheritance better (maybe it already works?) or better validations.
            # The issue is that we will have "text" if it's actually text but could also be "thinking"
            attributes do
              # TODO: scared to explicitly put one_of: because Anthropic might just drop in new values.
              type :string, :required # , one_of: ["text", "thinking"]

              # Only present when type is "text"
              text :string

              # Only present when type is "thinking"
              thinking :string
              signature :string
            end
          end
        end
      end
    end
  end
end
