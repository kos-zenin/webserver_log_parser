# frozen_string_literal: true

module Files
  module Parsers
    module Logs
      class Line
        def initialize(line:)
          @line = line
        end

        def call; end
      end
    end
  end
end
