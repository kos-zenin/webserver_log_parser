# frozen_string_literal: true

describe ::Files::Data::Logs::Row do
  subject { described_class.new(route: route, ip: ip) }

  let(:route) { '/test/2' }
  let(:ip) { '1.1.1.1' }

  its(:route) { is_expected.to eq route }
  its(:ip) { is_expected.to eq ip }
end
