RSpec.describe Foobara::Ai::AnthropicApi::GetPageOfModels do
  let(:inputs) do
    {
      api_token:,
      limit: 2
    }
  end
  let(:api_token) { ENV.fetch("ANTHROPIC_API_KEY", nil) }

  let(:command) { described_class.new(inputs) }
  let(:outcome) { command.run }
  let(:result) { outcome.result }
  let(:errors) { outcome.errors }

  it "returns a page of models", vcr: { record: :none } do
    expect(outcome).to be_success
    expect(result).to be_a(Foobara::Ai::AnthropicApi::Types::PageOfModels)
    expect(result.has_more).to be(true)
  end
end
