# frozen_string_literal: true

module Files
  module Readers
    class Log
      WHITELIST_EXTENSIONS = %w[.log].freeze

      def initialize(file_proxy: File)
        @file_proxy = file_proxy
      end

      def call(file:)
        validate(file)

        open_file(file).lazy.each do |line|
          yield line if block_given?
        end
      end

      private

      def open_file(file)
        @file_proxy.open(file, 'rb')
      rescue Errno::EACCES, Errno::ENOENT
        false
      end

      def validate(file)
        raise ArgumentError, 'Check file extension' unless WHITELIST_EXTENSIONS.include?(@file_proxy.extname(file))
        raise ArgumentError, 'Check file permissions' unless open_file(file)
      end
    end
  end
end
