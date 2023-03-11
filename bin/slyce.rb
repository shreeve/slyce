#!/usr/bin/env ruby

VERSION=0.0.1

require "bundler/setup"
require "mysql2"
require "optparse"

dbas = nil

OptionParser.new.instance_eval do
  @banner  = "usage: #{program_name} [options] <database>"

  on "-c", "--columns", "Display column names and quit"
  on "-h", "--help"   , "Show help and command usage" do Kernel.abort to_s; end
  on "-v", "--version", "Show version number" do Kernel.abort "#{program_name} #{VERSION}"; end

  dbas = ARGV.shift or Kernel.abort "no database given"

  self
end.parse!(into: opts={}) rescue abort($!.message)
