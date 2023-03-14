require "counter"

RSpec.describe Counter do
  it "adds a number to the count" do
    expect(Counter.new.add(5)).to eq 5
  end
  
  it "returns the current count value" do
    counter = Counter.new
    counter.add(5)
    expect(counter.report).to eq "Counted to 5 so far."
  end
end