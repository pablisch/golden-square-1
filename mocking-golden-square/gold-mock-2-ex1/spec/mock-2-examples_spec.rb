RSpec.describe "doubles" do
  # Change `xit` to `it` one by one as you work through.

  it "sets up a blank double" do
    # Set up your doubles here
    fake_object = double :fake

    # Don't edit below
    expect(fake_object).to be
  end

  it "sets up a double with methods" do
    # Set up your doubles here
    fake_object = double :cat, speak: "Meow", count_ears: 2, count_legs: 4

    # Don't edit below
    expect(fake_object.speak).to eq "Meow"
    expect(fake_object.count_ears).to eq 2
    expect(fake_object.count_legs).to eq 4
  end

  it "sets up a double with methods that take arguments" do
    # Set up your doubles here
    fake_object = double :cat
    allow(fake_object).to receive(:speak).with("Jess").and_return("Meow, Jess")

    # Don't edit below
    expect(fake_object.speak("Jess")).to eq "Meow, Jess"
    # Don't stub this next one
    # It's just to verify you've set up the double correctly
    expect { fake_object.speak("Ron") }.to raise_error RSpec::Mocks::MockExpectationError
  end

  it "sets up doubles that expect to be called" do
    fake_object = double :animal
    # Write an expectation below that the method "speak" is called with
    # the argument "Steve"
    expect(fake_object).to receive(:speak).with("Steve")
    # ...

    # Don't edit below
    fake_object.speak("Steve")
  end

  it "creates a double for a specific case" do
    fake_diary = double :diary, add: nil, count_entries: 2
    # Set up this double to pass the tests below
    # ...

    # Don't edit below
    fake_diary.add(double :diary_entry)
    fake_diary.add(double :diary_entry)
    expect(fake_diary.count_entries).to eq 2
  end
end

RSpec.describe "doubles challenge" do
  it "creates a sophisticated double" do
    task_list = double :list
    task = double :task
    allow(task_list).to receive(:add).with(task)
    allow(task_list).to receive(:list).and_return([task])
    allow(task_list).to receive(:count).and_return(1)
    allow(task_list).to receive(:clear).and_return(:success)


    # Don't edit below
    task_list.add(task)
    expect(task_list.list).to eq [task]
    expect(task_list.count).to eq 1
    expect(task_list.clear).to eq :success
  end
end