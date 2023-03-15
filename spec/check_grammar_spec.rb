require "check_grammar"

RSpec.describe "check_grammar method" do
  context "text has correct structure" do
    it "returns compliance message" do
      expect(check_grammar("Hello world!")).to eq "Starts with a captial letter and ends with suitable puctuation."
    end

    it "returns compliance message" do
      expect(check_grammar("World hello?")).to eq "Starts with a captial letter and ends with suitable puctuation."
    end
  end

  context "no text input" do
    it "returns no text message" do
      expect(check_grammar("")).to eq "There is no text to check."
    end
  end

  context "Does not start with capital letter" do
    it "returns no capital message when starting with lowercase" do
      expect(check_grammar("hello world!")).to eq "Has no starting capital letter."
    end

    it "returns no capital message when starting with whitespace" do
      expect(check_grammar(" hello world!")).to eq "Has no starting capital letter."
    end

    it "returns no capital message when starting with symbol" do
      expect(check_grammar("@hello world!")).to eq "Has no starting capital letter."
    end

    it "returns no capital message when starting with punctuation" do
      expect(check_grammar("!hello world!")).to eq "Has no starting capital letter."
    end
  end

  context "text is missing suitable end punctuation" do
    it "returns no suitable end punctuation message when ending in letter" do
      expect(check_grammar("Hello world")).to eq "Does not end with suitable punctuation."
    end

  end
end