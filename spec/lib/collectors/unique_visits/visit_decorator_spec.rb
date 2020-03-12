# frozen_string_literal: true

describe ::Collectors::UniqueVisits::VisitDecorator do
  subject { described_class.new }

  let(:visit) { instance_double(::Collectors::UniqueVisits::Visit, route: '/test', count: count) }
  let(:count) { 100 }

  describe 'call' do
    it 'formats visit' do
      expect(subject.call(visit)).to eq('/test 100 unique views')
    end

    context "when 1 view" do
      let(:count) { 1 }

      it 'formats visit' do
        expect(subject.call(visit)).to eq('/test 1 unique view')
      end
    end
  end
end
