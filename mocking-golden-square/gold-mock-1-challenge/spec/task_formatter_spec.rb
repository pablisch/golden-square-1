require "task_formatter"

RSpec.describe TaskFormatter do
  it "returns a formatted task string" do
    task_1 = double :task, title: "Walk the dog", complete?: false
    formatter = TaskFormatter.new(task_1)
    expect(formatter.format).to eq "- [ ] Walk the dog"
  end

  it "returns a formatted task string for a completed task" do
    task_1 = double :task, title: "Sleep", complete?: true
    formatter = TaskFormatter.new(task_1)
    expect(formatter.format).to eq "- [x] Sleep"
  end
end
