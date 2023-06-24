require "todolist_02_09"

RSpec.describe TodoList do
  it "fails when no todos have been entered" do
    diary = Diary.new
    list = TodoList.new
    expect { list.view(diary) }.to raise_error "There are no todos to view."
  end
end