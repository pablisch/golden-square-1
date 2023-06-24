require "repeater"

RSpec.describe StringRepeater do
  it "repates a string x times" do
    io = double :io
    repeater = StringRepeater.new(io)
    expect(io).to receive(:puts).with("Hello. I will repeat a string many times.")
    expect(io).to receive(:puts).with("Please enter a string")
    expect(io).to receive(:gets).and_return("TWIX")
    expect(io).to receive(:puts).with("Please enter a number of repeats")
    expect(io).to receive(:gets).and_return("10")
    expect(io).to receive(:puts).with("Here is your result:")
    expect(io).to receive(:puts).with("TWIXTWIXTWIXTWIXTWIXTWIXTWIXTWIXTWIXTWIX")
    repeater.run
  end
end