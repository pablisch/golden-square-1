require "test"

RSpec.describe Test do
  it "example 1" do
    fake = double :fake_class
    allow(fake).to receive(:greet).with("Pablo").and_return("Hello, Pablo!") # deals with method args in a stricter way than no specifying
    expect(fake.greet("Pablo")).to eq "Hello, Pablo!"
  end

  it "example 1b" do
    track = double :track
    allow(track).to receive(:details).with("Fela", "Water").and_return("Artist: Fela, Song: Water") # the fake method must have 2 args
    expect(track.details("Fela", "Water")).to eq "Artist: Fela, Song: Water"
  end

  it "example 1b" do
    track = double :track
    expect(track).to receive(:details).with("Fela", "Water").and_return("Artist: Fela, Song: Water") # expect here indicates that the fake method must, rather than can, be called
    expect(track.details("Fela", "Water")).to eq "Artist: Fela, Song: Water"
  end

  it "example 1b" do
    track = double :track
    expect(track).to receive(:details).with("Fela", "Water").and_return("Artist: Fela, Song: Water") # expect here indicates that the fake method must, rather than can, be called
    allow(track).to receive(:more_details).with("Fela", "Water").and_return("Artist: Fela, Song: Water")
    expect(track.details("Fela", "Water")).to eq "Artist: Fela, Song: Water"
  end
end