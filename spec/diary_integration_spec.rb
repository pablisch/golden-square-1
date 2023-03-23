require "diary"
require "secret_diary"

RSpec.describe "integration" do
  it "reads an unlocked diary" do
    diary = Diary.new("hello")
    secret_diary = SecretDiary.new(diary)
    secret_diary.unlock
    expect(secret_diary.read).to eq "hello"
  end

  it "fails when asked to read a locked diary" do
    diary = Diary.new("hello")
    secret_diary = SecretDiary.new(diary)
    secret_diary.unlock
    secret_diary.lock
    expect { secret_diary.read }.to raise_error "Go away!"
  end
end

