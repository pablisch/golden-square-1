require "check_codeword"

RSpec.describe "check_codeword method" do
  context "codeword matches horse" do
    it "returns greeting when passed 'horse'" do
      expect(check_codeword("horse")).to eq "Correct! Come in."
    end
  end

  context "codeword first char 'h', last char 'e' and isn't horse" do
    it "returns 'close' message when passed 'house'" do
      expect(check_codeword("house")).to eq "Close, but nope."
    end
  end

  context "codeword doesn't include first char 'h', last char 'e' or isn't horse" do
    it "returns 'wrong' message when passed 'fools'" do
      expect(check_codeword("fools")).to eq "WRONG!"
    end
  end
end