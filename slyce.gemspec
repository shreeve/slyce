# encoding: utf-8

Gem::Specification.new do |s|
  s.name        = "slyce"
  s.version     = `grep '^VERSION' bin/slyce | cut -f 2 -d '"'`
  s.author      = "Steve Shreeve"
  s.email       = "steve.shreeve@gmail.com"
  s.summary     =
  s.description = "Ruby utility to show data statistics for MySQL databases"
  s.homepage    = "https://github.com/shreeve/slyce"
  s.license     = "MIT"
  s.files       = `git ls-files`.split("\n") - %w[.gitignore]
  s.executables = `cd bin && git ls-files .`.split("\n")
  s.add_runtime_dependency "extralite-bundle", "~> 1.2.5"
  s.add_runtime_dependency "mysql2", "~> 0.5"
end
