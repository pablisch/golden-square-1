{{PROBLEM}} Class Design Recipe

1. Describe the Problem
   Put or write the user story here. Add any clarifying notes you might have.

```ruby
# As a user
# So that I can keep track of my tasks
# I want a program that I can add todo tasks to and see a list of them.
add todo & view_list
# As a user
# So that I can focus on tasks to complete
# I want to mark tasks as complete and have them disappear from the list.
mark_complete (will make todo disappear)
```

2. Design the Class Interface
   Include the initializer and public methods with all parameters and return values.

# EXAMPLE

```ruby
class TodoList
  def initialize#(name) # name is a string
    # initialise todo_list as an empty array
  end

  def add(todo) # todo is a string
    # throws an exception if todo is empty
    # throws an exception if todo already exists
    # otherwise, adds capitalised todo to todo_list array and outputs a confirmation message
  end

  def view_list
    # returns the todo_list array in viewer-friendly format
  end

  def mark_completed(completed_todo) # completed_todo is a string
    # throws an exception if todo_list is already empty
    # throws an exception if completed_todo is empty
    # throws an exception if completed_todo does not match todos in array
    # otherwise, removes todo from todo_list and outputs a confirmation message
  end
end
```

3. Create Examples as Tests
   Make a list of examples of how the class will behave in different situations.

# EXAMPLE

```ruby
# fail when there are no items to view
list = TodoList.new
list.view_list # => fails with "No todo given."

# return confirmation when an item is added (result of puts)
list = TodoList.new
list.todo("take a break") # => "'Take a break' has been added to your todo list."

# return list with todo item/s
list = TodoList.new
list.todo("take a break")
list.view_list # => "* Take a break"

list = TodoList.new
list.todo("take a break")
list.todo("get more sleep")
list.view_list # => "* Take a break \n * Get more sleep"

# fail when todo item already exists
list = TodoList.new
list.todo("take a break")
list.todo("take a break") # => fails with "That todo is already on your list. Nothing was added."

# fail when trying to complete todo but list is empty
list = TodoList.new
list.mark_completed("take a break")
list.view_list # => fails with "All todos are already completed."

# fail when trying to complete todo but passing an empty string
list = TodoList.new
list.todo("get more sleep")
list.mark_completed("")
list.view_list # => fails with "No todo was entered as completed."

# fail when trying to complete todo but there is no match
list = TodoList.new
list.todo("get more sleep")
list.mark_completed("take a break")
list.view_list # => fails with "That task is not on your list of todos."

# delete from list and output confirmation when completed_todo has match"
list = TodoList
list.todo("take a break")
list.mark_completed("take a break")
list.view_list # => "'Take a break' has been completed and removed from your list of todos."

# return list when items added, marked as complete and then list viewed
list = TodoList.new
list.todo("take a break")
list.todo("get more sleep")
list.todo("go for a walk")
list.mark_completed("go for a walk")
list.view_list # => "* Take a break \n * Get more sleep"

list = TodoList.new
list.todo("take a break")
list.todo("get more sleep")
list.todo("go for a walk")
list.todo("sit in the sun")
list.todo("talk to a friend")
list.mark_completed("go for a walk")
list.mark_completed("take a break")
list.view_list # => "* Get more sleep \n Sit in the sun \n Talk to a friend"
```

Encode each example as a test. You can add to the above list as you go.

4. Implement the Behaviour
   After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour.
