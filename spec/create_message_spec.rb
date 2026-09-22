RSpec.describe Foobara::Ai::AnthropicApi::CreateMessage do
  let(:inputs) do
    {
      api_token:,
      messages:,
      system:
    }
  end
  let(:api_token) { ENV.fetch("ANTHROPIC_API_KEY", nil) }
  let(:system) { "You are like a scientist that answers questions very concisely and accurately." }
  let(:messages) do
    [
      {
        role: "user",
        content:
      }
    ]
  end

  let(:command) { described_class.new(inputs) }
  let(:outcome) { command.run }
  let(:result) { outcome.result }
  let(:errors) { outcome.errors }
  let(:errors_hash) { outcome.errors_hash }
  let(:content) { "What is the PH of honey?" }

  it "can create a message result", vcr: { record: :none } do
    expect(outcome).to be_success
    expect(result).to be_a(Foobara::Ai::AnthropicApi::Types::MessageResult)
    expect(result.text).to match(/pH.*\d+\.\d+ (and|to) \d+\.\d+/i)
  end

  context "with other models" do
    let(:inputs) do
      {
        api_token:,
        messages:,
        system:,
        model:
      }
    end

    context "with claude-sonnet-5" do
      let(:model) { "claude-sonnet-5" }

      it "can create a message result", vcr: { record: :none } do
        expect(outcome).to be_success
        expect(result).to be_a(Foobara::Ai::AnthropicApi::Types::MessageResult)
        expect(result.text).to match(/pH.*\d+\.\d+/i)
      end
    end

    context "with claude-fable-5-1" do
      let(:model) { "claude-fable-5-1" }
      let(:content) {  "Please think extra carefully about this: what is the PH of honey?" }

      it "can create a message result", vcr: { record: :none } do
        expect(outcome).to be_success
        expect(result).to be_a(Foobara::Ai::AnthropicApi::Types::MessageResult)
        expect(result.text).to match(/pH.*\d+\.\d+/i)
      end
    end
  end
end
