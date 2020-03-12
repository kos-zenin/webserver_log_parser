# frozen_string_literal: true

describe ::Files::Data::Logs::Row do
  subject { described_class.new(route, ip) }

  let(:route) { '/test/2' }
  let(:ip) { '1.1.1.1' }

  its(:route) { is_expected.to eq route }
  its(:ip) { is_expected.to eq ip }

  describe 'valid?' do
    context 'when route and ip has valid format' do
      it 'returns true' do
        expect(subject.valid?).to be_truthy
      end
    end

    context 'when route has invalid format' do
      let(:route) { 'route' }

      it 'returns false' do
        expect(subject.valid?).to be_falsey
      end
    end

    context 'when ip has invalid format' do
      let(:ip) { '2001:db8:85a3::8a2e:370:7334' }

      it 'returns false' do
        expect(subject.valid?).to be_falsey
      end
    end
  end
end
