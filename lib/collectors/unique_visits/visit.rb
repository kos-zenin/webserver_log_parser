# frozen_string_literal: true

module Collectors
  module UniqueVisits
    class Visit
      def initialize(route:)
        @route = route
        @count = 0
      end

      attr_reader :route, :count

      def increment_visit
        @count += 1
      end
    end
  end
end
