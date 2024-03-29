module Foobara
  module Ai
    module Anththropic
      module Types
        class Message < Foobara::Model
          attributes do
            content :array do
              text :string, :required
              type :string, :required, one_of: %w[text]
            end
            id :string, :required
            model :model, :required
            role :role, :required
            stop_reason :string, :required, one_of: %w[end_turn max_tokens stop_sequence]
            stop_sequence :string, :allow_nil
            type :string, :required, one_of: %w[message]
            usage do
              input_tokens :integer, :required
              output_tokens :integer, :required
            end
          end
        end
      end
    end
  end
end
