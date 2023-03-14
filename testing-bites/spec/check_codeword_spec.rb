require "check_codeword"

RSpec.describe "check_codeword method" do
  context "codeword matches horse" do
    it "returns greeting when passed horse" do
      expect(check_codeword("horse")).to eq "Correct! Come in."
    end
  end
end