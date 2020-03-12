# frozen_string_literal: true

module Files
  module Data
    module Logs
      class Row < Struct.new(:route, :ip)
        def valid?; end
      end
    end
  end
end
