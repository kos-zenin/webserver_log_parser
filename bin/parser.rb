#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative './../config/boot'

LOGS_PARSER = ::Files::Parsers::Logs::File.new
def parse(file:, parser: LOGS_PARSER, &block)
  raise ArgumentError, "Usage: #{$PROGRAM_NAME} FILENAME" if file.nil?

  parser.call(file: file) do |line|
    block.call(line)
  end
end

UNIQUE_VISITS_COLLECTOR = ::Collectors::UniqueVisits::Visits.new
def collect(visit:, collector: UNIQUE_VISITS_COLLECTOR)
  collector.add(visit: visit)
end

VISITS_STDOUT_REPORTER = ::Reporters::Stdout.new
STDOUT_REPORTER = ::Reporters::Stdout.new(decorator: ->(string) { string })
def report(results: [], reporter: VISITS_STDOUT_REPORTER)
  reporter.call(results: results)
end

if $PROGRAM_NAME == __FILE__
  begin
    parse(file: ARGV[0]) { |visit| collect(visit: visit) }

    report(results: UNIQUE_VISITS_COLLECTOR.visits)
  rescue ArgumentError => e
    STDOUT_REPORTER.call(results: [e])
  end
end
