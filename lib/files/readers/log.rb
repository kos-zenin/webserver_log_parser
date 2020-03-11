module Files
  module Readers
    class Log
      def initialize(file_proxy: File)
        @file_proxy = file_proxy
      end

      def call(file:); end
    end
  end
end
