require "word_counter"

describe "count_words method" do
  it "returns 1 when one word is given" do
    expect(count_words("one")).to eq 1
  end 

  it "returns 5 when five words are given" do
    expect(count_words("one two three four five")).to eq 5
  end 

  it "returns 0 when no words are given" do
    expect(count_words("")).to eq 0
  end 

  it "returns 2 when 'one    two    ' given" do
    expect(count_words("one    two    ")).to eq 2
  end
end