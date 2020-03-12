# frozen_string_literal: true

module Reporters
  class Stdout
    def initialize(decorator: ::Collectors::UniqueVisits::VisitDecorator.new)
      @decorator = decorator
    end

    def call(results: [])
      results.each do |result|
        puts @decorator.call(visit: result)
      end
    end
  end
end
