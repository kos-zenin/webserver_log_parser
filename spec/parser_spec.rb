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
    let(:expected_result) do
      {
        '1.1.1.1' => 10,
        '2.2.2.2' => 5
      }
    end

    it 'parses file, builds history of visits in descending order' do
      expect(parse(file: file)).to eq(expected_result)
    end
  end
end
