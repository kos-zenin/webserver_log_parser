# frozen_string_literal: true

module Collectors
  module UniqueVisits
    class VisitDecorator
      DEFAULT_FORMAT = "%{route} %{count} unique visits"

      def initialize(format: DEFAULT_FORMAT)
        @format = format
      end

      def call(visit:); end
    end
  end
end
