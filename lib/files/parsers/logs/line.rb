# frozen_string_literal: true

module Files
  module Parsers
    module Logs
      class Line
        ROUTE_REGEX = %r{^/\w+(/\w+)*$}.freeze
        IP_REGEX = /^\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}$/.freeze

        def initialize(line:)
          @line = line
        end

        def call
          route, ip = @line.split(' ')

          [route, ip] if valid_route?(route) && valid_ip?(ip)
        end

        private

        def valid_route?(route)
          route =~ ROUTE_REGEX
        end

        def valid_ip?(ip)
          ip =~ IP_REGEX
        end
      end
    end
  end
end
