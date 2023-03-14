require 'greet'

RSpec.describe "greet method" do
  it "Puts 'Hello,' before user input and '!' at the end" do
    result = greet("Bob")
    expect(result).to eq "Hello, Bob!" 
  end
end