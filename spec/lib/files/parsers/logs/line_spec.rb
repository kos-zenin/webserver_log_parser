# frozen_string_literal: true

describe ::Files::Parsers::Logs::Line do
  subject { described_class.new(line: line) }

  describe "call" do
    context "when line is correct" do
      let(:line) { "/test/2 902.1.12.0" }

      it "returns url, ip" do
        expect(subject.call).to eq(["/test/2", "902.1.12.0"])
      end
    end

    context "when line is mailformed" do
      let(:line) { "invalid line" }

      it "returns empty value" do
        expect(subject.call).to be_nil
      end
    end
  end
end
