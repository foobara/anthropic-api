require_relative "base_command"
require "foobara/cached_command"

module Foobara
  module Ai
    module AnthropicApi
      class ListModels < BaseCommand
        include CachedCommand

        self.foobara_cache_expiry = 24 * 60 * 60

        description "A convenience command that will repeatedly fetch pages of models until all are fetched"

        inputs do
          page_size :integer, max: 2000, min: 1, default: 20
          api_token :string, :allow_nil
        end

        result [Types::Model]

        depends_on GetPageOfModels

        def execute
          get_page_of_models

          extract_models

          while has_more?
            get_next_page_of_models
            extract_models
          end

          models
        end

        attr_accessor :page_of_models

        def get_page_of_models
          self.page_of_models = run_subcommand!(GetPageOfModels, get_page_of_models_inputs)
        end

        def extract_models
          models.concat(page_of_models.data)
        end

        def has_more?
          page_of_models.has_more
        end

        def get_next_page_of_models
          inputs = get_page_of_models_inputs.merge(after_id: page_of_models.last_id)
          self.page_of_models = run_subcommand!(GetPageOfModels, inputs)
        end

        def models
          @models ||= []
        end

        def get_page_of_models_inputs
          return @get_page_of_models_inputs if @get_page_of_models_inputs

          @get_page_of_models_inputs = {}

          if page_size
            @get_page_of_models_inputs[:limit] = page_size
          end

          @get_page_of_models_inputs
        end
      end
    end
  end
end
