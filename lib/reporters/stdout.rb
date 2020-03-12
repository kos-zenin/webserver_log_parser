# frozen_string_literal: true

module Reporters
  class Stdout
    def initialize(decorator: ::Collectors::UniqueVisits::VisitDecorator.new)
      @decorator = decorator
    end

    def call(results: []); end
  end
end
