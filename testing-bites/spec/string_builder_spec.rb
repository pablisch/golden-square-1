require "string_builder"

RSpec.describe StringBuilder do
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

  it "compares size and output length when 'Sun', 'sh' and 'ine!' are added" do
    string = StringBuilder.new
    string.add("Sun")
    string.add("sh")
    string.add("ine!")
    expect(string.size).to eq string.output.length
  end
end