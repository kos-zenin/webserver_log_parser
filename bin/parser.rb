#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative './../config/boot'

DEFAULT_PARSER = ::Files::Parsers::Logs::File.new
def parse(file:, parser: DEFAULT_PARSER)
  raise ArgumentError, "Usage: #{$PROGRAM_NAME} FILENAME" if file.nil?

  parser.call(file: file)
end

DEFAULT_COLLECTOR = ::Collectors::UniqueVisits::Main.new
def collect(visits: [], collector: DEFAULT_COLLECTOR)
  collector.call(visits: visits)
end

DEFAULT_REPORTER = ->(results:) {}
def report(results: [], reporter: DEFAULT_REPORTER)
  reporter.call(results: results)
end

if $PROGRAM_NAME == __FILE__
  parse(file: ARGV[0])
    .then { |visits| collect(visits: visits) }
    .then { |results| report(results: results) }
end
