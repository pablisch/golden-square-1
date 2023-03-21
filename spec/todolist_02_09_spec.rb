require "todolist_02_09"

RSpec.describe TodoList do
  it "fails when no todos have been entered" do
    diary = Diary.new
    list = TodoList.new
    expect { list.view(diary) }.to raise_error "There are no todos to view."
  end

  # it "passes a todo list" do
  #   diary = Diary.new
  #   list = TodoList.new
  #   entry_1 = Entry.new("todo", "sleep")
  #   diary.add(entry_1)
  #   expect { list.view(diary) }.to output("* Sleep\n").to_stdout
  # end

end