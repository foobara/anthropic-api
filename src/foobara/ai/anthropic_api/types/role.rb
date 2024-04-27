module Foobara
  module Ai
    module AnthropicApi
      module Types
        module RoleEnum
          ASSISTANT = :assistant
          USER = :user
        end
      end

      Types::Role = foobara_register_type(:role, :symbol, one_of: Types::RoleEnum)
    end
  end
end
