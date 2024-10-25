# encoding: utf-8

Gem::Specification.new do |s|
  s.name        = "slyce"
  s.version     = `grep -m 1 '^\s*@version' bin/slyce | cut -f 2 -d '"'`
  s.author      = "Steve Shreeve"
  s.email       = "steve.shreeve@gmail.com"
  s.summary     =  "A " +
  s.description = "Ruby utility to show statistics for databases or csv files"
  s.homepage    = "https://github.com/shreeve/slyce"
  s.license     = "MIT"
  s.files       = `git ls-files`.split("\n") - %w[.gitignore]
  s.executables = `cd bin && git ls-files .`.split("\n")
  s.add_runtime_dependency "any_ascii", "~> 0.3.2"
  s.add_runtime_dependency "censive", "~> 1.1.0"
  s.add_runtime_dependency "duckdb", "~> 0.9"
  s.add_runtime_dependency "extralite-bundle", "~> 2.1"
  s.add_runtime_dependency "mysql2", "~> 0.5"
end
