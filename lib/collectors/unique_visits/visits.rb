# frozen_string_literal: true

module Collectors
  module UniqueVisits
    class Visits
      def initialize(sorter: ::Collectors::UniqueVisits::Sorter.new)
        @sorter = sorter
        @visits = {}
      end

      def add(visit:)
        @visits[visit.route] ||= ::Collectors::UniqueVisits::Visit.new(route: visit.route)

        @visits[visit.route].increment_visit!
      end

      def visits
        @sorter.call(visits: @visits.values)
      end
    end
  end
end
