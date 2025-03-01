require_relative "../list_models"

module Foobara
  module Ai
    module AnthropicApi
      module Types
        model_list = ListModels.run!.map(&:id).sort
        ModelEnum = Foobara::Enumerated.make_module(model_list)

        AnthropicApi.foobara_register_type(:model_enum, :string, one_of: ModelEnum)
      end
    end
  end
end
