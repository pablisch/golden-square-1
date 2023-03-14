require "diary"

describe "diary make_snippet method" do
  describe "test strings containing under six words" do
    context "given 'Hello World!'" do
      it "returns 'Hello World!'" do
        expect(make_snippet("Hello World!")).to eq "Hello World!"
      end
    end

    context "given an empty string" do
      it "returns an empty string" do
        expect(make_snippet("")).to eq ""
      end
    end

    context "given 'one two three four five'" do
      it "returns 'one two three four five'" do
        expect(make_snippet("one two three four five")).to eq "one two three four five"
      end
    end
  end

  describe "test strings containing over five words" do
    context "given 'Hello World! How are you today?'" do
      it "returns 'Hello World! How are you...'" do
        expect(make_snippet("Hello World! How are you today?")).to eq "Hello World! How are you..."
      end
    end

    context "given 'In this project you will build personal diary system.'" do
      it "returns 'In this project you will...'" do
        expect(make_snippet("In this project you will build personal diary system.")).to eq "In this project you will..."
      end
    end

    context "given a whole paragraph" do
      it "returns the first five words plus '...'" do
        expect(make_snippet("Test-driven development is an approach to building software in the same way that Karate is an approach to combat. It structures everything you do. At first it will feel strange and you will want to resume your unstructured approach. However, it allows you to tackle much greater problems.")).to eq "Test-driven development is an approach..."
      end
    end
  end
end