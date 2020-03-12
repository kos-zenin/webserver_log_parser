# frozen_string_literal: true

module Collectors
  module UniqueVisits
    class VisitDecorator
      DEFAULT_FORMAT = '%<route>s %<count>s unique views'

      def initialize(format: DEFAULT_FORMAT)
        @format = format
      end

      def call(visit:)
        format(@format, route: visit.route, count: visit.count)
      end
    end
  end
end
