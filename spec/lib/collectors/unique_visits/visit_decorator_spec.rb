# frozen_string_literal: true

describe ::Collectors::UniqueVisits::VisitDecorator do
  subject { described_class.new }

  let(:visit) { instance_double(::Collectors::UniqueVisits::Visit, route: "/test", count: 100) }

  describe 'call' do
    it 'formats visit' do
      expect(subject.call(visit: visit)).to eq("/test 100 unique views")
    end
  end
end
