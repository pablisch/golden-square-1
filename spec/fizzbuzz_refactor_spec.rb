require "fizzbuzz_refactor"

RSpec.shared_examples 'a fizzbuzz number' do |number, expected_output|
  it "returns #{expected_output.inspect} when passed #{number}" do
    expect(fizzbuzz(number)).to eq expected_output
  end
 end
 
 
 describe 'fizzbuzz' do
  include_examples 'a fizzbuzz number', 12, 'fizz'
  include_examples 'a fizzbuzz number', 15, 'fizzbuzz'
  include_examples 'a fizzbuzz number', 25, 'buzz'
 end
 
 