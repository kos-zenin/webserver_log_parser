#!/usr/bin/env ruby
# frozen_string_literal: true

DEFAULT_PARSER = ->() {}
def parse(file:, parser: DEFAULT_PARSER)
  raise ArgumentError, "Usage: #{$0} FILENAME" if file.nil?
end

DEFAULT_REPORTER = ->() {}
def report(results, reporter: DEFAULT_REPORTER)
end

if $0 == __FILE__
  parse(file: ARGV[0]).then { |results| report(results) }
end
