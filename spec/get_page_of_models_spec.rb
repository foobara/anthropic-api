RSpec.describe Foobara::Ai::AnthropicApi::GetPageOfModels do
  before do
    allow(command).to receive(:api_token_from_env).and_return(nil)
  end

  around do |example|
    old_token = Foobara::Ai::AnthropicApi.api_token

    begin
      Foobara::Ai::AnthropicApi.api_token = api_token
      example.run
    ensure
      Foobara::Ai::AnthropicApi.api_token = old_token
    end
  end

  let(:inputs) do
    { limit: 2 }
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
