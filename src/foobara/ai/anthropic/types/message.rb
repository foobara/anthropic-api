module Foobara
  module Ai
    module Anththropic
      module Types
        class Message < Foobara::Model
          attributes do
            role :string, one_of: %w[assistant user]
            content :string
          end
        end
      end
    end
  end
end
