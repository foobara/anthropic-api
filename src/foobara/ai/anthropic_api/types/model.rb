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
          end
        end
      end
    end
  end
end
