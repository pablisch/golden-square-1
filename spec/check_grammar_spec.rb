require "check_grammar"

RSpec.describe "check_grammar method" do

  # messages that may be returned ==
  compliant = "Starts with a captial letter and ends with suitable puctuation."
  no_text = "There is no text to check."
  no_capital = "Has no starting capital letter."
  no_end_punctuation = "Does not end with suitable punctuation."
  zero_compliance = "Does not start with a capital letter nor end with suitable punction."

  context "text has correct structure" do
    it "returns compliance message" do
      expect(check_grammar("Hello world!")).to eq compliant
    end

    it "returns compliance message" do
      expect(check_grammar("World hello?")).to eq compliant
    end
  end

  context "no text input" do
    it "returns no text message" do
      expect(check_grammar("")).to eq no_text
    end

    it "returns no text message" do
      expect(check_grammar("!")).to eq no_text
    end
  end

  context "Does not start with capital letter" do
    it "returns no capital message when starting with lowercase" do
      expect(check_grammar("hello world!")).to eq no_capital
    end

    it "returns no capital message when starting with whitespace" do
      expect(check_grammar(" hello world!")).to eq no_capital
    end

    it "returns no capital message when starting with symbol" do
      expect(check_grammar("@hello world!")).to eq no_capital
    end

    it "returns no capital message when starting with punctuation" do
      expect(check_grammar("!hello world!")).to eq no_capital
    end
  end

  context "text is missing suitable end punctuation" do
    it "returns no suitable end punctuation message when ending in letter" do
      expect(check_grammar("Hello world")).to eq no_end_punctuation
    end

    it "returns no suitable end punctuation message when ending in wrong punctuation" do
      expect(check_grammar("Hello world,")).to eq no_end_punctuation
    end

    it "returns no suitable end punctuation message when ending in whitespace" do
      expect(check_grammar("Hello world ")).to eq no_end_punctuation
    end
  end

  context "text is missing begnning capital AND suitable end punctuation" do
    it "returns both case errors message when starting in lowercase AND ending in letter" do
      expect(check_grammar("hello world")).to eq zero_compliance
    end

    it "returns both case errors message when starting in lowercase AND when ending in wrong punctuation" do
      expect(check_grammar("hello world,")).to eq zero_compliance
    end

    it "returns both case errors message when starting with whitespace AND when ending in wrong punctuation" do
      expect(check_grammar(" Hello world-")).to eq zero_compliance
    end
  end
end