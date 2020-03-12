# frozen_string_literal: true

describe ::Files::Parsers::Logs::Line do
  subject { described_class.new(line: line) }

  describe 'call' do
    context 'when line is correct' do
      let(:line) { '/test/2 902.1.12.0' }
      let(:row) { instance_double(::Files::Data::Logs::Row, valid?: true) }

      before do
        expect(::Files::Data::Logs::Row).to receive(:new).with('/test/2', '902.1.12.0').and_return(row)
      end

      it 'returns url, ip' do
        expect(subject.call).to eq(row)
      end
    end

    context 'when line is mailformed' do
      let(:line) { 'invalid line' }
      let(:row) { instance_double(::Files::Data::Logs::Row, valid?: false) }

      before do
        expect(::Files::Data::Logs::Row).to receive(:new).with('invalid', 'line').and_return(row)
      end

      it 'returns empty value' do
        expect(subject.call).to be_nil
      end
    end
  end
end
