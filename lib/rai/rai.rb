# frozen_string_literal: true

module RAI
  @prompt = TTY::Prompt.new
  @options = {
    "Ask" => :ask,
    "Generate Image" => :generate,
    "Exit" => :exit,
  }

  def self.ask_user(question)
    print question
    gets.chomp
  end

  def self.start
    case @prompt.select("Choose an option", @options)
    when :ask
      AI::ask(ask_user("What is your question? "))
    when :generate
      AI::generate_image(ask_user("Just type a random word: "))
    when :exit
      exit
    end
  end
end
