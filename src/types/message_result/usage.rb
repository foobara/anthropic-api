module Foobara
  module Ai
    module AnthropicApi
      module Types
        class MessageResult < Foobara::Model
          class Usage < Foobara::Model
            attributes do
              input_tokens :integer, :required
              output_tokens :integer, :required

              # TODO: no clue if this can actually be null
              cache_creation_input_tokens :integer, :allow_nil
              # TODO: no clue if this can actually be null
              cache_read_input_tokens :integer, :allow_nil
              # TODO: type this
              cache_creation :duckture, :allow_nil
              # TODO: appears to be some kind of enum. No clue if it can be null
              service_tier :string, :allow_nil
              # TODO: appears to be some kind of enum. No clue if it can be null
              inference_geo :string, :allow_nil
            end
          end
        end
      end
    end
  end
end
