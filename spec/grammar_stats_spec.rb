require "grammar_stats"

RSpec.describe GrammarStats do

  describe "#check" do
    it "fails when no text is passed" do
      stats = GrammarStats.new
      expect { stats.check("") }.to raise_error "No text to check."
    end

    context "check passes" do
      it "returns true when starts with CAP and ends in correct punctuation" do
        stats = GrammarStats.new
        expect(stats.check("Hello!")).to eq true
      end
    end

    context "check does not pass" do
      it "returns false when does not end with punctuation" do
        stats = GrammarStats.new
        expect(stats.check("Hello")).to eq false
      end

      it "returns false when does not end with correct punctuation" do
        stats = GrammarStats.new
        expect(stats.check("He!lo,")).to eq false
      end

      it "returns false when starts with lowercase" do
        stats = GrammarStats.new
        expect(stats.check("heLlo!")).to eq false
      end

      it "returns false when starts with punctuation" do
        stats = GrammarStats.new
        expect(stats.check("!heLlo!")).to eq false
      end
    end
  end

  describe "#percentage_good" do
    it "fails because no tests have been carried out" do
      stats = GrammarStats.new
      expect { stats.percentage_good }.to raise_error "No tests have been carried out yet."
    end

    it "returns zero when no checks performed but none have passed" do
      stats = GrammarStats.new
      stats.check("hello")
      expect(stats.percentage_good).to eq 0
    end

    context "returns a positve result between 1 and 100 when checks have passed" do
      it "returns 50 when half checks have passed" do
        stats = GrammarStats.new
        stats.check("hello")
        stats.check("Hello!")
        expect(stats.percentage_good).to eq 50
      end

      it "returns 100 when all checks have passed" do
        stats = GrammarStats.new
        stats.check("Mellow?")
        stats.check("Hello!")
        expect(stats.percentage_good).to eq 100
      end

      it "returns 25 when 1/4 checks have passed" do
        stats = GrammarStats.new
        stats.check("Mellow?")
        stats.check("bello!")
        stats.check("Mellow")
        stats.check("ello")
        expect(stats.percentage_good).to eq 25
      end
    end
  end
end