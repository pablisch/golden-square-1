require "diary"
require "secret_diary"

RSpec.describe "integration" do
  it "reads an unlocked diary" do
    diary = Diary.new("hello")
    secret_diary = SecretDiary.new(diary)
    secret_diary.unlock
    expect(secret_diary.read).to eq "hello"
  end
end

