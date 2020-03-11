# frozen_string_literal: true

module Files
  module Parsers
    module Logs
      class File
        def initialize(file_reader: ::Files::Readers::Log.new)
          @file_reader = file_reader
        end

        def call(file:)
          @file_reader.call(file: file) do |line|
            route, ip = ::Files::Parsers::Logs::Line.new(line: line).call

            yield ::Files::Data::Logs::Row.new(route: route, ip: ip) if route && ip
          end
        end
      end
    end
  end
end
