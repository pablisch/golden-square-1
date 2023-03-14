require "string_builder"

RSpec.describe StringBuilder do
  it "returns a string length of 4 when funk is added" do
    string = StringBuilder.new
    string.add("funk")
    expect(string.size).to eq 4
  end
end