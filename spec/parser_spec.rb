# frozen_string_literal: true

require_relative './../bin/parser'

describe 'parse' do
  context "when file isn't passed" do
    it 'raises argument error' do
      expect { parse(file: nil) }.to raise_exception(ArgumentError)
    end
  end

  context 'when file passed' do
    let(:file) { instance_double('file') }
    let(:test_parser) { ->(file:) { file } }

    it 'parses file, builds history of visits in descending order' do
      expect(parse(file: file, parser: test_parser)).to eq(file)
    end
  end
end

describe 'collect' do
  let(:subject) { collect(visit: sample_visit, collector: collector) }
  let(:sample_visit) { 'test visits' }
  let(:collector) { instance_double(::Collectors::UniqueVisits::Visits) }

  it 'calls collector' do
    expect(collector).to receive(:add).with(visit: sample_visit)
    subject
  end
end

describe 'report' do
  let(:subject) { report(results: sample_results, reporter: test_reporter) }
  let(:sample_results) { 'test results' }
  let(:test_reporter) { ->(results:) { results } }

  it 'calls reporter' do
    expect(subject).to eq(sample_results)
  end
end
