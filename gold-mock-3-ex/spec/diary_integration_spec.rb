require "secret_diary"
require "diary"

RSpec.describe "diary integration" do
  describe "Reading diary entries" do
    it "raises an error, go away when trying to read a new secret diary" do
      diary = Diary.new("Hello")
      secret = SecretDiary.new(diary)
      expect { secret.read }.to raise_error "Go Away!"
    end
    
    it "returns contents if diary is unlocked" do
      diary = Diary.new("Hello")
      secret = SecretDiary.new(diary)
      secret.unlock
      expect(secret.read).to eq "Hello"
    end

    it "raises an error, go away when diary has been locked" do
      diary = Diary.new("Hello")
      secret = SecretDiary.new(diary)
      secret.unlock
      secret.lock
      expect { secret.read }.to raise_error "Go Away!"
    end
  end
end