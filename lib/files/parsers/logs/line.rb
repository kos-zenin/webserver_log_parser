# frozen_string_literal: true

module Files
  module Parsers
    module Logs
      class Line
        def initialize(line:)
          @line = line
        end

        def call
          route, ip = @line.split(' ')

          row = ::Files::Data::Logs::Row.new(route, ip)

          row if row.valid?
        end
      end
    end
  end
end
