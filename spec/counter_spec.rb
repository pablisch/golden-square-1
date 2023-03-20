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

  it "returns the current count value of multiple adds" do
    counter = Counter.new
    counter.add(5)
    counter.add(6)
    counter.add(7)
    expect(counter.report).to eq "Counted to 18 so far."
  end

  it "returns the current count value including zero, negative numbers and floats" do
    counter = Counter.new
    counter.add(0)
    counter.add(-2)
    counter.add(0.5)
    expect(counter.report).to eq "Counted to -1.5 so far."
  end
end

# Below is a refactored way of performing the last to tests.
# Hardly worth it for two but any additional tests would be very concise

RSpec.shared_examples "number(s) to be added" do |num1, num2, num3, count|
  it "returns the current #{count} when #{num1}, #{num2} and #{num3} are added" do
    counter = Counter.new
    counter.add(num1)
    counter.add(num2)
    counter.add(num3)
    expect(counter.report).to eq "Counted to #{count} so far."
  end
end

describe "returns the current count value" do
  include_examples "number(s) to be added", 5, 6, 7, 18
  include_examples "number(s) to be added", 0, -2, 0.5, -1.5
end