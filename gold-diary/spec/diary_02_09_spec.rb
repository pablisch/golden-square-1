require "diary_02_09"

RSpec.describe Diary do
  it "fails when #read_all is called and there are no posts" do
    diary = Diary.new
    expect { diary.read_diary }.to raise_error "There are no posts to read yet."
  end

  it "fails when #find_entry_to_read is called and there are no posts" do
    diary = Diary.new
    expect { diary.find_entry_to_read(1, 1) }.to raise_error "There are no posts to read yet."
  end
end