require "secret_diary"

RSpec.describe SecretDiary do
  it "reads an unlocked diary" do
    diary = double :diary, read: "hello"
    secret_diary = SecretDiary.new(diary)
    secret_diary.unlock
    expect(secret_diary.read).to eq "hello"
  end

  it "fails when asked to read a locked diary" do
    diary = double :diary
    secret_diary = SecretDiary.new(diary)
    expect { secret_diary.read }.to raise_error "Go away!"
  end

  it "fails when asked to read a locked diary" do
    diary = double :diary
    secret_diary = SecretDiary.new(diary)
    secret_diary.unlock
    secret_diary.lock
    expect { secret_diary.read }.to raise_error "Go away!"
  end
end