{{PROBLEM}} Method Design Recipe
Copy this into a recipe.md in your project and fill it out.

1. Describe the Problem
   Put or write the user story here. Add any clarifying notes you might have.

As a user
So that I can keep track of my tasks
I want to check if a text includes the string #TODO.

2. Design the Method Signature
   Include the name of the method, its parameters, return value, and side effects.

```ruby
# method will track_tasks looking for "#TODO" and return a Boolean value.
track_tasks(text)

```

# The method doesn't print anything or have any other side-effects

3. Create Examples as Tests
   Make a list of examples of what the method will take and return.

```ruby
track_tasks("#TODO") => true
track_tasks("Hello #TODO Goodbye!") => true
track_tasks("#TODOOBIE") => true
track_tasks("#TO DO") => false
track_tasks("#TOD") => false
track_tasks("ODOT#") => false
track_tasks("#TODO#TODO") => true
# track_tasks("") => fail return "No text given."

```

# EXAMPLE

extract_uppercase("hello WORLD") => ["WORLD"]
extract_uppercase("HELLO WORLD") => ["HELLO", "WORLD"]
extract_uppercase("hello world") => []
extract_uppercase("hello WoRLD") => []
extract_uppercase("hello WORLD!") => ["WORLD"]
extract_uppercase("") => []
extract_uppercase(nil) throws an error
Encode each example as a test. You can add to the above list as you go.

4. Implement the Behaviour
   After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour.
