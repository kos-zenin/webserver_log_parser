# frozen_string_literal: true

describe ::Files::Parsers::Logs::File do
  subject { described_class.new(file_reader: test_file_reader) }

  let(:test_file_reader) { instance_double(::Files::Readers::Log) }
  let(:file) { "file path" }

  describe "call" do
    let(:expected_rows) { [valid_row] }
    let(:valid_row) { instance_double(::Files::Data::Logs::Row) }
    let(:line_parser) { instance_double(::Files::Parsers::Logs::Line, call: ["/test", "1.1.1.1"]) }

    let(:valid_line) { "/test 1.1.1.1" }

    before do
      expect(test_file_reader).to receive(:call).with(file: file).and_yield(valid_line)

      expect(::Files::Parsers::Logs::Line).to receive(:new).with(line: valid_line).and_return(line_parser)
      expect(::Files::Data::Logs::Row).to receive(:new).with(route: "/test", ip: "1.1.1.1").and_return(valid_row)
    end

    it "iterates over log lines and yields row" do
      result_rows = []
      subject.call(file: file) do |line|
        result_rows << line
      end

      expect(result_rows).to eq(expected_rows)
    end
  end
end
