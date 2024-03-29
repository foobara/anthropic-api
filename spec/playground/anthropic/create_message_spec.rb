RSpec.describe Foobara::Ai::Anthropic::CreateMessage do
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

  it "can generate a completion", vcr: { record: :none } do
    expect(outcome).to be_success
    expect(result).to be_a(Foobara::Ai::Anthropic::Types::MessageResult)
    expect(result.choices.first.message.content).to match(/pH of honey.*\d+\.\d+ and \d+\.\d+/)
  end
end
