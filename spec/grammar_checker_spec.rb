require "grammar_checker"

RSpec.describe "check_grammar method" do
  context "Returns true for a correct one word sentence" do
    it "Returns true for 'Hello.'" do
      expect(check_grammar("Hello.")).to eq true
    end

    it "Returns true for 'Hello!'" do
      expect(check_grammar("Hello!")).to eq true
    end

    it "Returns true for 'Yes?'" do
      expect(check_grammar("Yes?")).to eq true
    end

    it "Returns true for 'No.'" do
      expect(check_grammar("No.")).to eq true
    end

    it "Returns true for 'True!'" do
      expect(check_grammar("True!")).to eq true
    end

    it "Returns true for 'Hello?'" do
      expect(check_grammar("Hello?")).to eq true
    end
  end

  context "Returns false for an incorrect one word sentence" do
    it "Returns false for 'hello'" do
      expect(check_grammar("hello")).to eq false
    end

    it "Returns false for 'hello.'" do
      expect(check_grammar("hello.")).to eq false
    end

    it "Returns false for 'Hello'" do
      expect(check_grammar("Hello")).to eq false
    end

    it "Returns false for 'Yello'" do
      expect(check_grammar("Yello")).to eq false
    end
  end

  context "Returns true for correct multi-word sentences" do
    it "Returns true for 'Hello world.'" do
      expect(check_grammar("Hello world.")).to eq true
    end

    it "Returns true for 'Hello there world?'" do
      expect(check_grammar("Hello there world?")).to eq true
    end

    it "Returns true for 'Hello there world!'" do
      expect(check_grammar("Hello there world!")).to eq true
    end

    it "Returns true for 'Falls mainly on the plain..'" do
      expect(check_grammar("Falls mainly on the plain..")).to eq true
    end
  end

  context "Returns false for incorrect multi-word sentences" do
    it "Returns false for 'hello there, world!'" do
      expect(check_grammar("hello there, world!")).to eq false
    end

    it "Returns false for 'hello there world?'" do
      expect(check_grammar("hello there world?")).to eq false
    end

    it "Returns false for 'the rain in spain...'" do
      expect(check_grammar("the rain in spain...")).to eq false
    end

    it "Returns false for '...And so on...'" do
      expect(check_grammar("...And so on...")).to eq false
    end

    it "Returns false for '1234 Five o clock rock.'" do
      expect(check_grammar("1234 Five o clock rock.")).to eq false
    end
  end
end
