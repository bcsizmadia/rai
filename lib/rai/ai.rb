# frozen_string_literal: true

module AI
  OpenAI.configure do |config|
    config.access_token = Token::check_token
  end

  @gpt = OpenAI::Client.new

  def self.ask(prompt)
    puts @gpt.completions(
      parameters: {
        model: "text-davinci-003",
        prompt: prompt,
        max_tokens: 200,
      },
    )["choices"].map { |c| c["text"] }
  end

  def self.generate_image(prompt)
    puts @gpt.images.generate(parameters: { prompt: prompt, size: "256x256" })["data"][0]["url"]
  end
end
