require "greet"

RSpec.describe "greet method" do
  it "returns 'Hello, Pablo!' when passed 'Pablo'" do
    expect(greet("Pablo")).to eq "Hello, Pablo!"
  end
end