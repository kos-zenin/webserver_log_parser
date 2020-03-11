# frozen_string_literal: true

module Files
  module Data
    module Logs
      class Row
        def initialize(route:, ip:)
          @route = route
          @ip = ip
        end

        attr_reader :route, :ip
      end
    end
  end
end
