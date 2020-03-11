# frozen_string_literal: true

module Files
  module Parsers
    module Logs
      class File
        def initialize(file_reader: ::Files::Readers::Log)
          @file_reader = file_reader
        end

        def call(file:); end
      end
    end
  end
end
