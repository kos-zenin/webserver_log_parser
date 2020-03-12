# frozen_string_literal: true

require_relative './../bin/parser'
require 'open3'

context 'unit tests' do
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
end

context 'integration tests' do
  describe 'parser.rb' do
    subject { Open3.capture2("#{script_path} #{logfile_path}").first }

    let(:script_path) { File.expand_path('../bin/parser.rb', dir_name) }
    let(:logfile_path) { File.expand_path('logfiles/webserver.log', dir_name) }
    let(:dir_name) { File.dirname(__FILE__) }
    let(:printed_result) { result_lines.join('') }

    let(:result_lines) do
      [
        "/help_page/1 3 unique views\n",
        "/about/2 2 unique views\n",
        "/home 1 unique view\n",
        "/index 1 unique view\n"
      ]
    end

    it 'prints sorted list of readable visits to stdout' do
      expect(subject).to eq(printed_result)
    end

    context 'when file is empty' do
      let(:logfile_path) { File.expand_path('logfiles/empty_webserver.log', dir_name) }

      it 'prints nothing' do
        expect(subject).to eq('')
      end
    end

    context 'when no file provided' do
      let(:logfile_path) { nil }

      it 'prints an error' do
        expect(subject).to eq("Usage: #{File.expand_path('../bin/parser.rb', dir_name)} FILENAME\n")
      end
    end

    context 'when wrong file extension' do
      let(:logfile_path) { File.expand_path('logfiles/webserver.txt', dir_name) }

      it 'prints an error' do
        expect(subject).to eq("Check file extension\n")
      end
    end
  end
end
