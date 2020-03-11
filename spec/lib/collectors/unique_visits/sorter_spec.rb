# frozen_string_literal: true

describe ::Collectors::UniqueVisits::Sorter do
  subject { described_class.new(direction: direction) }

  let(:test_visit) { Struct.new(:count) }
  let(:visits) do
    [
      test_visit.new(10),
      test_visit.new(100),
      test_visit.new(50),
      test_visit.new(43)
    ]
  end

  describe 'call' do
    context 'when descending direction' do
      let(:direction) { :desc }
      let(:sorted_visits) { [test_visit.new(100), test_visit.new(50), test_visit.new(43), test_visit.new(10)] }

      it 'returns sorted visits' do
        expect(subject.call(visits: visits)).to eq(sorted_visits)
      end
    end

    context 'when ascending direction' do
      let(:direction) { :asc }
      let(:sorted_visits) { [test_visit.new(10), test_visit.new(43), test_visit.new(50), test_visit.new(100)] }

      it 'returns sorted visits' do
        expect(subject.call(visits: visits)).to eq(sorted_visits)
      end
    end
  end
end
