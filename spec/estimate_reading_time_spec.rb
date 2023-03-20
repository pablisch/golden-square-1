require "estimate_reading_time"

RSpec.describe "estimate_reading_time method" do
  it "returns 0 for a text of 0 words" do
    expect(estimate_reading_time("")).to eq 0
  end

  it "returns 1 for a text of 200 words" do
    text = ""
    200.times { text << "word "}
    expect(estimate_reading_time(text)).to eq 1
  end

  it "returns 5 for a text of 1000 words" do
    text = ""
    1000.times { text << "word "}
    expect(estimate_reading_time(text)).to eq 5
  end

  it "returns 0.005 for a text of 1 word" do
    expect(estimate_reading_time("hi")).to eq 0.005
  end

  it "returns 0.5 for a text of 100 words" do
    text = ""
    100.times { text << "word "}
    expect(estimate_reading_time(text)).to eq 0.5
  end

  it "returns 0.05 for a text of 10 words" do
    text = ""
    10.times { text << "word "}
    expect(estimate_reading_time(text)).to eq 0.05
  end
end