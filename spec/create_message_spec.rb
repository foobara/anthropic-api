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
        content: "What is the PH of honey?"
      }
    ]
  end

  let(:command) { described_class.new(inputs) }
  let(:outcome) { command.run }
  let(:result) { outcome.result }
  let(:errors) { outcome.errors }

  it "can create a message result", vcr: { record: :none } do
    expect(outcome).to be_success
    expect(result).to be_a(Foobara::Ai::AnthropicApi::Types::MessageResult)
    expect(result.content.first.text).to match(/pH of honey.*\d+\.\d+ (and|to) \d+\.\d+/i)
  end
end
