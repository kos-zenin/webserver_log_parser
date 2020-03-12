# frozen_string_literal: true

describe ::Reporters::Stdout do
  subject { described_class.new(decorator: decorator) }

  let(:results) { ["first line", "second_line"] }

  let(:decorator) { instance_double(::Collectors::UniqueVisits::VisitDecorator) }

  describe 'call' do
    before do
      expect(decorator).to receive(:call).with(visit: "first line").and_return("formatted first line")
      expect(decorator).to receive(:call).with(visit: "second_line").and_return("formatted second_line")
    end

    it 'iterates over results and prints every result to stdout' do
      expect(subject).to receive(:print).with("formatted first line")
      expect(subject).to receive(:print).with("formatted second_line")

      subject.call(results: results)
    end
  end
end
