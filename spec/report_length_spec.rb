require "report_length"

RSpec.describe "report_length method" do
  it "puts 'This string was 4 chars long' when passed 'drop'" do
    expect(report_length("drop")).to eq "This string was 4 characters long."
  end

  it "puts 'This string was 0 chars long' when passed ''" do
    expect(report_length("")).to eq "This string was 0 characters long."
  end

  it "puts 'This string was 11 chars long' when passed ''" do
    expect(report_length("Hello\n \"Q\".")).to eq "This string was 11 characters long."
  end
end