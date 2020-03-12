# frozen_string_literal: true

module Files
  module Data
    module Logs
      class Row < Struct.new(:route, :ip)
        ROUTE_REGEX = %r{^/\w+(/\w+)*$}.freeze
        IP_REGEX = /^\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}$/.freeze

        def valid?
          route =~ ROUTE_REGEX && ip =~ IP_REGEX
        end
      end
    end
  end
end
