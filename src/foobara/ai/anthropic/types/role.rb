module Foobara
  module Ai
    module Anththropic
      module Types
        module RoleEnum
          ASSISTANT = :assistant
          USER = :user
        end

        Role = Anthropic.foobara_register_type(:role, :symbol, one_of: RoleEnum)
      end
    end
  end
end
