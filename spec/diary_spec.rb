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
end