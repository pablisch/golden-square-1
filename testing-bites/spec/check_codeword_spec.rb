require "check_codeword"

RSpec.shared_examples "a codeword checked" do |codeword, message|
  it "returns #{message} when codeword given is #{codeword}." do
    expect(check_codeword(codeword)).to eq message
  end
end

describe "check_codeword method" do
  include_examples "a codeword checked", "horse", "Correct! Come in."
  include_examples "a codeword checked", "house", "Close, but nope."
  include_examples "a codeword checked", "fools", "WRONG!"
  include_examples "a codeword checked", "human", "WRONG!"
  include_examples "a codeword checked", "phone", "WRONG!"
  include_examples "a codeword checked", "", "WRONG!"
end

# *** Unrefactored code below, left for example ***

# RSpec.describe "check_codeword method" do
#   context "codeword matches horse" do
#     it "returns greeting when passed 'horse'" do
#       expect(check_codeword("horse")).to eq "Correct! Come in."
#     end
#   end

#   context "codeword first char 'h', last char 'e' and isn't horse" do
#     it "returns 'close' message when passed 'house'" do
#       expect(check_codeword("house")).to eq "Close, but nope."
#     end
#   end

#   context "codeword doesn't include first char 'h', last char 'e' or isn't horse" do
#     it "returns 'wrong' message when passed 'fools'" do
#       expect(check_codeword("fools")).to eq "WRONG!"
#     end
  
#     it "returns 'wrong' message when passed 'human'" do
#       expect(check_codeword("human")).to eq "WRONG!"
#     end

#     it "returns 'wrong' message when passed 'phone'" do
#       expect(check_codeword("phone")).to eq "WRONG!"
#     end 
#   end
  
#   context "blank string entered" do
#     it "returns 'WRONG!' message when passed blank string" do
#       expect(check_codeword("")).to eq "WRONG!"
#     end
#   end
# end