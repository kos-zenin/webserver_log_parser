#!/usr/bin/env ruby
# frozen_string_literal: true

DEFAULT_PARSER = -> {}
def parse(file:, parser: DEFAULT_PARSER)
  raise ArgumentError, "Usage: #{$PROGRAM_NAME} FILENAME" if file.nil?

  parser.call(file)
end

DEFAULT_REPORTER = -> {}
def report(results, reporter: DEFAULT_REPORTER)
  reporter.call(results)
end

if $PROGRAM_NAME == __FILE__
  parse(file: ARGV[0])
    .then { |results| report(results) }
end
