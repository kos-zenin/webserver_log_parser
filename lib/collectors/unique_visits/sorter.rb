# frozen_string_literal: true

module Collectors
  module UniqueVisits
    class Sorter
      DESC_DIRECTION = :desc
      ASC_DIRECTION = :asc

      def initialize(direction: DESC_DIRECTION)
        @direction = direction
      end

      def call(visits: [])
        @direction == DESC_DIRECTION ? descending_sort(visits) : ascending_sort(visits)
      end

      private

      def descending_sort(visits)
        visits.sort { |a, b| b.count <=> a.count }
      end

      def ascending_sort(visits)
        visits.sort { |a, b| a.count <=> b.count }
      end
    end
  end
end
