require_relative "base_command"

module Foobara
  module Ai
    module AnthropicApi
      class GetPageOfModels < BaseCommand
        path "/models"

        add_inputs do
          before_id :string
          after_id :string
          limit :integer, max: 2000, min: 1
        end

        result Types::PageOfModels

        def build_request_body
          body = {}

          body[:before_id] = before_id if before_id
          body[:after_id] = after_id if after_id
          body[:limit] = limit if limit

          self.request_body = body
        end

        def build_result
          Types::PageOfModels.new(response_body, ignore_unexpected_attributes: true)
        end
      end
    end
  end
end
