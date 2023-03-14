require "add_five"

RSpec.describe "add_five method" do
  it "adds 5 to 3 to return 8" do
    expect(add_five(3)).to eq 8
  end
end