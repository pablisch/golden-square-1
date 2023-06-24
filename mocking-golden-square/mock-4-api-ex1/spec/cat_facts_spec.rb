require "cat_facts"

RSpec.describe CatFacts do
  it "returns a cat fact" do
    responder = double :responder
    expect(responder).to receive(:get).with(URI("https://catfact.ninja/fact")).and_return('{"fact":"Cats hate the water because their fur does not insulate well when it\u2019s wet. The Turkish Van, however, is one cat that likes swimming. Bred in central Asia, its coat has a unique texture that makes it water resistant.","length":216}')
    fact = CatFacts.new(responder)
    expect(fact.provide).to eq "Cat fact: Cats hate the water because their fur does not insulate well when it\u2019s wet. The Turkish Van, however, is one cat that likes swimming. Bred in central Asia, its coat has a unique texture that makes it water resistant."
  end
end

# {"fact":"Cats hate the water because their fur does not insulate well when it\u2019s wet. The Turkish Van, however, is one cat that likes swimming. Bred in central Asia, its coat has a unique texture that makes it water resistant.","length":216}