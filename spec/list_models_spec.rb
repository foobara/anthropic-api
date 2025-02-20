RSpec.describe Foobara::Ai::AnthropicApi::ListModels do
  before do
    FileUtils.rm_f("tmp/cached_command/foobara/ai/anthropic_api/list_models.json")
    Foobara::CachedCommand.cache.clear
  end

  let(:inputs) do
    {
      api_token:,
      page_size: 2
    }
  end
  let(:api_token) { ENV.fetch("ANTHROPIC_API_KEY", nil) }

  let(:command) { described_class.new(inputs) }
  let(:outcome) { command.run }
  let(:result) { outcome.result }
  let(:errors) { outcome.errors }

  it "returns a page of models", vcr: { record: :none } do
    expect(outcome).to be_success
    expect(result).to be_an(Array)
    expect(result.first.type).to eq("model")
  end
end
