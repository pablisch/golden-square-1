require "string_builder"

RSpec.describe StringBuilder do
  context "No strings are added" do
    it "returns a string length of 0 when nothing is added" do
      string = StringBuilder.new
      expect(string.size).to eq 0
    end

    it "returns an empty string when nothing is added" do
      string = StringBuilder.new
      expect(string.output).to eq ""
    end
  end

  context "A single string is added" do
    it "returns a string length of 4 when funk is added" do
      string = StringBuilder.new
      string.add("funk")
      expect(string.size).to eq 4
    end

    it "returns funk when funk is added" do
      string = StringBuilder.new
      string.add("funk")
      expect(string.output).to eq "funk"
    end
  end

  context "Two strings are added" do
    it "returns a string length of 5 when 'funk' and 'y' are added" do
      string = StringBuilder.new
      string.add("funk")
      string.add("y")
      expect(string.size).to eq 5
    end

    it "returns 'funky' when 'funk' and 'y' are added" do
      string = StringBuilder.new
      string.add("funk")
      string.add("y")
      expect(string.output).to eq "funky"
    end
  end

  context "Three strings are added" do
    it "returns a string length of 9 when 'Sun', 'sh' and 'ine!' are added" do
      string = StringBuilder.new
      string.add("Sun")
      string.add("sh")
      string.add("ine!")
      expect(string.size).to eq 9
    end

    it "returns 'Sunshine!' when 'Sun', 'sh' and 'ine!' are added" do
      string = StringBuilder.new
      string.add("Sun")
      string.add("sh")
      string.add("ine!")
      expect(string.output).to eq "Sunshine!"
    end
  end

  it "compares size and output length when 'Sun', 'sh' and 'ine!' are added" do
    string = StringBuilder.new
    string.add("Sun")
    string.add("sh")
    string.add("ine!")
    expect(string.size).to eq string.output.length
  end
end