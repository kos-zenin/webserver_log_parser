# frozen_string_literal: true

module Collectors
  module UniqueVisits
    class Main
      def initialize(sorter: ::Collectors::UniqueVisits::Sorter.new)
        @sorter = sorter
      end

      def call(visits: [])
        combine(visits)
          .then { |combined_visits| @sorter.call(visits: combined_visits) }
      end

      private

      def combine(visits)
        visits.each_with_object({}) do |visit, memo|
          memo[visit.route] ||= ::Collectors::UniqueVisits::Visit.new(route: visit.route)

          memo[visit.route].increment_visit
        end.values
      end
    end
  end
end
