# frozen_string_literal: true

describe ::Collectors::UniqueVisits::Visit do
  subject { described_class.new(route: route) }

  let(:route) { "/test" }

  describe 'increment_visit' do
    it "adds new visit" do
      expect(subject.count).to eq(0)
      10.times { subject.increment_visit }
      expect(subject.count).to eq(10)
    end
  end
end
