# encoding: utf-8

Gem::Specification.new do |gem|
  gem.name        = "slyce"
  gem.version     = `grep -m 1 '^\s*@version' bin/slyce | cut -f 2 -d '"'`
  gem.author      = "Steve Shreeve"
  gem.email       = "steve.shreeve@gmail.com"
  gem.summary     =  "A " +
  gem.description = "Ruby utility to show statistics for databases or csv files"
  gem.homepage    = "https://github.com/shreeve/slyce"
  gem.license     = "MIT"
  gem.files       = `git ls-files`.split("\n") - %w[.gitignore]
  gem.executables = `cd bin && git ls-files .`.split("\n")
  gem.required_ruby_version = Gem::Requirement.new(">= 3.0") if gem.respond_to? :required_ruby_version=
  gem.add_runtime_dependency "any_ascii", "~> 0.3.2"
  gem.add_runtime_dependency "bigdecimal", "~> 3.1.0"
  gem.add_runtime_dependency "censive", "~> 1.1.0"
  gem.add_runtime_dependency "duckdb", "~> 1.1.2"
  gem.add_runtime_dependency "extralite-bundle", "~> 2.1"
  gem.add_runtime_dependency "mysql2", "~> 0.5"
end
