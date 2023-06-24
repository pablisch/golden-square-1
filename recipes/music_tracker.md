{{PROBLEM}} Class Design Recipe

1. Describe the Problem
   Put or write the user story here. Add any clarifying notes you might have.

```ruby
# As a user
# So that I can keep track of my music listening
# I want to add tracks I've listened to and see a list of them.
```

2. Design the Class Interface
   Include the initializer and public methods with all parameters and return values.

# EXAMPLE

```ruby
class MusicTracker
  def initialize
    # @track_list = []
  end

  def add(track) # track is a string
    # fail if string is empty
    # will not add duplicates
    # will add new tracks to an array of tracks, @track_list
    # returns nothing
  end

  def list
    # Throws an exception if @track_list is empty
    # Otherwise, returns a user friendly list of tracks in @track_list
  end
end
```

3. Create Examples as Tests
   Make a list of examples of how the class will behave in different situations.

# EXAMPLE

```ruby
tracker = MusicTracker.new
tracker.add("") # => fails returning "No track name given."

tracker = MusicTracker.new
tracker.add("Tell Her")
tracker.list # => "* Tell Her\n"

tracker = MusicTracker.new
tracker.add("Baby Night")
tracker.list # => "* Baby Night\n"

tracker = MusicTracker.new
tracker.list # => fails returning "There are no tracks to list."

tracker = MusicTracker.new
tracker.add("Tell Her")
tracker.add("Baby Night")
tracker.add("Mother Sky")
tracker.add("Birth of Creation")
tracker.list # => "* Tell Her\n* Baby Night\n* Mother Sky\n* Birth of Creation\n"
```

Encode each example as a test. You can add to the above list as you go.

4. Implement the Behaviour
   After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour.
