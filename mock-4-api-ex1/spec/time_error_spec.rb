require "time_error"

RSpec.describe TimeError do
  it "returns the time error" do
    time_error = TimeError.new
    expect(time_error).to eq "?"
  end
end