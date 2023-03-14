require "greet"

RSpec.describe "greet method" do
  it "returns 'Hello, Pablo!' when passed 'Pablo'" do
    expect(greet("Pablo")).to eq "Hello, Pablo!"
  end

  it "returns 'Hello, Sabina!' when passed 'Sabina'" do
    expect(greet("Sabina")).to eq "Hello, Sabina!"
  end
end