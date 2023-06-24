require "task_list"

RSpec.describe TaskList do
  it "initially has an empty list" do
    task_list = TaskList.new
    expect(task_list.all).to eq []
  end

  it "is initially not all complete" do
    task_list = TaskList.new
    expect(task_list.all_complete?).to eq false
  end

  it "adds tasks to a list" do
    task_list = TaskList.new
    task_1 = double :task
    task_2 = double :task
    task_list.add(task_1)
    task_list.add(task_2)
    expect(task_list.all).to eq [task_1, task_2]
  end
  
  it "marks tasks as complete" do
    task_list = TaskList.new
    task_1 = double :task1, mark_complete: true, complete?: true
    task_2 = double :task2, mark_complete: true, complete?: true
    task_list.add(task_1)
    task_list.add(task_2)
    # task_1.mark_complete
    # task_2.mark_complete
    expect(task_list.all_complete?).to eq true
  end

  # Unit test `#all` and `#all_complete?` behaviour
end
