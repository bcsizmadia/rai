# frozen_string_literal: true

require_relative "lib/rai/version"

Gem::Specification.new do |spec|
  spec.name = "rai"
  spec.version = Rai::VERSION
  spec.authors = ["Bence Csizmadia"]

  spec.summary = "A CLI for OpenAI's GPT-3 API"
  spec.homepage = "https://github.com/bcsizmadia/rai"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.4.0")

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{\A(?:test|spec|features)/}) }
  end

  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "ruby-openai", "~> 3.7.0"

  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "rubocop", "~> 0.80"
end
