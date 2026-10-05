require_relative "base_command"

module Foobara
  module Ai
    module AnthropicApi
      class GetModel < BaseCommand
        include CachedCommand

        self.foobara_cache_expiry = 24 * 60 * 60

        def foobara_cache_key
          @foobara_cache_key ||= [Util.underscore(self.class.name), model].join("-")
        end

        path { "/models/#{model}" }

        add_inputs do
          model :model_enum, :required
        end

        result Types::Model

        def build_result
          Types::Model.new(response_body,
                           # Set this to false to discover new attributes
                           ignore_unexpected_attributes: true)
        end
      end
    end
  end
end
