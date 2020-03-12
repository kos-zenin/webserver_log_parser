# Description

This is an application for parsing logs.

There are 3 modules of the app:
- file readers

  Responsible for file reading and parsing, handles file errors and skips invalid rows if any.

  File reader streams each row directly to consumer to support huge files, lazy enumerator allows not to load enormous file into memory

- collectors

  Strategy to gather data.

  There is only one for collecting number of unique visitors for each endpoint

- reporters

  Strategy for reporting data.

  There is only one reporting to stdout, there could be email\file reporters in future

# Usage

## Run

To run the parser
  `./bin/parser.rb webserver.log`

## Tests

- code linter:
  `./bin/rubocop`

- specs:
  `./bin/rspec`
