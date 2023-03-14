require "diary"

describe "diary make_snippet method" do
  describe "test strings containing under six words" do
    it "make_snippet('Hello World!') returns same" do
      expect(make_snippet("Hello World!")).to eq "Hello World!"
    end

    it "make_snippet('') returns same" do
      expect(make_snippet("")).to eq ""
    end

    it "make_snippet('one two three four five') returns same" do
      expect(make_snippet("one two three four five")).to eq "one two three four five"
    end
  end

  describe "test strings containing over five words" do
    it "make_snippet('Hello World!') returns same" do
      expect(make_snippet("Hello World! How are you today")).to eq "Hello World! How are you..."
    end

    it "make_snippet('In this project you will build personal diary system.') returns same" do
      expect(make_snippet("In this project you will build personal diary system.")).to eq "In this project you will..."
    end

    it "Whole paragraph returns same" do
      expect(make_snippet("Test-driven development is an approach to building software in the same way that Karate is an approach to combat. It structures everything you do. At first it will feel strange and you will want to resume your unstructured approach. However, it allows you to tackle much greater problems.")).to eq "Test-driven development is an approach..."
    end
  end
end