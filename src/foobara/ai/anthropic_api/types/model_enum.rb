module Foobara
  module Ai
    module AnthropicApi
      module Types
        module ModelEnum
          CLAUDE_3_5_SONNET = "claude-3-5-sonnet-20240620".freeze
          CLAUDE_3_OPUS = "claude-3-opus-20240229".freeze
          CLAUDE_3_SONNET = "claude-3-sonnet-20240229".freeze
          CLAUDE_3_HAIKU = "claude-3-haiku-20240307".freeze
        end

        Model = AnthropicApi.foobara_register_type(:model, :string, one_of: ModelEnum)
      end
    end
  end
end
