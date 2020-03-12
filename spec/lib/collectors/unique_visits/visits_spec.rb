# frozen_string_literal: true

describe ::Collectors::UniqueVisits::Visits do
  subject { described_class.new }

  let(:visit_struct) { Struct.new(:route) }
  let(:visits) do
    [
      visit_struct.new('c'), visit_struct.new('c'),
      visit_struct.new('a'), visit_struct.new('a'), visit_struct.new('a'), visit_struct.new('a'),
      visit_struct.new('b'), visit_struct.new('b'), visit_struct.new('b')
    ]
  end

  let(:expected_visits) do
    [a_visit, b_visit, c_visit]
  end

  let(:a_visit) { instance_double(::Collectors::UniqueVisits::Visit, count: 4) }
  let(:b_visit) { instance_double(::Collectors::UniqueVisits::Visit, count: 3) }
  let(:c_visit) { instance_double(::Collectors::UniqueVisits::Visit, count: 2) }

  describe 'add' do
    before do
      expect(::Collectors::UniqueVisits::Visit).to receive(:new).with(route: 'a').and_return(a_visit)
      expect(::Collectors::UniqueVisits::Visit).to receive(:new).with(route: 'b').and_return(b_visit)
      expect(::Collectors::UniqueVisits::Visit).to receive(:new).with(route: 'c').and_return(c_visit)

      expect(a_visit).to receive(:increment_visit).exactly(4).times
      expect(b_visit).to receive(:increment_visit).exactly(3).times
      expect(c_visit).to receive(:increment_visit).exactly(2).times
    end

    it 'builds combined visits and sorts them' do
      visits.each { |visit| subject.add(visit: visit) }
      expect(subject.visits).to eq(expected_visits)
    end
  end
end
