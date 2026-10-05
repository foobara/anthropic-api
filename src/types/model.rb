module Foobara
  module Ai
    module AnthropicApi
      module Types
        class Model < Foobara::Model
          attributes do
            id :string, :required
            display_name :string, :required
            type :string, :required
            created_at :datetime, :required
            # TODO: unclear if this can be null
            max_input_tokens :integer, :allow_nil
            # TODO: unclear if this can be null
            max_tokens :integer, :allow_nil
            # TODO: properly type this
            capabilities :duckture, :allow_nil
          end
        end
      end
    end
  end
end
