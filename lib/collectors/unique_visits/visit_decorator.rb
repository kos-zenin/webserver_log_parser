# frozen_string_literal: true

module Collectors
  module UniqueVisits
    class VisitDecorator
      VIEW_KEYWORD = 'view'
      VIEW_KEYWORD_PLURAL = 'views'
      VIEW_KEYWORD_PLURAL_MAPPING = {
        1 => VIEW_KEYWORD
      }.freeze
      DEFAULT_FORMAT = '%<route>s %<count>s unique %<view_text>s'

      def initialize(format: DEFAULT_FORMAT)
        @format = format
      end

      def call(visit)
        format(
          @format,
          route: visit.route,
          count: visit.count,
          view_text: VIEW_KEYWORD_PLURAL_MAPPING.fetch(visit.count, VIEW_KEYWORD_PLURAL)
        )
      end
    end
  end
end
