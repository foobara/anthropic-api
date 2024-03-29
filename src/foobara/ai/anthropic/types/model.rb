module Foobara
  module Ai
    module Anththropic
      module Types
        module ModelEnum
          CLAUDE_3_OPUS = :claude_3_opus_20240229
          CLAUDE_3_SONNET = :claude_3_sonnet_20240229
          CLAUDE_3_HAIKU = :claude_3_haiku_20240307
        end

        Model = Anthropic.foobara_register_type(
          :model,
          :symbol,
          default: ModelEnum::CLAUDE_3_OPUS,
          one_of: ModelEnum
        )
      end
    end
  end
end
