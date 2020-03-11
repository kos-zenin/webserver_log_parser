# frozen_string_literal: true

module Collectors
  module UniqueVisits
    class Main
      def initialize(visits: [])
        @visits = visits
      end

      def call(sorter: ::Collectors::UniqueVisits::Sorter.new); end
    end
  end
end
