require "word_counter"

describe "count_words method" do
  it "returns one when one word is given" do
    expect(count_words("one")).to eq 1
  end 
end