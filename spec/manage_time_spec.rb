require "manage_time"

RSpec.describe "manage_time method" do
  it "returns 0 if string is empty" do
    result = estimated_time("")
    expect(result).to eq 0.0
  end

  context "short string given" do
    it "returns a small number" do
      expect(estimated_time("Hello world")).to eq 0.01
    end
  end

end