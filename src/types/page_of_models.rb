require_relative "model"

module Foobara
  module Ai
    module AnthropicApi
      module Types
        class PageOfModels < Foobara::Model
          attributes do
            data [Types::Model], :required
            first_id :string, :allow_nil, :required
            last_id :string, :allow_nil, :required
            has_more :boolean, :required
          end
        end
      end
    end
  end
end
