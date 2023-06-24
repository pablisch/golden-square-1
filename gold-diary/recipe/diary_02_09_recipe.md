{{PROBLEM}} Multi-Class Planned Design Recipe

1. Describe the Problem
```ruby
As a user
So that I can record my experiences 
I want to keep a regular diary # keep/store diary entries

As a user
So that I can reflect on my experiences
I want to read my past diary entries # read diary entries

As a user
So that I can reflect on my experiences in my busy day
I want to select diary entries to read based on how much time I have and my reading speed
# select entries by wpm * minutes

As a user
So that I can keep track of my tasks
I want to keep a todo list along with my diary # todo list with diary

As a user
So that I can keep track of my contacts
I want to see a list of all of the mobile phone numbers in all my diary entries # list of mob no.s from diary
```
2. Design the Class System
Consider diagramming out the classes and their relationships. Take care to focus on the details you see as important, not everything. The diagram below uses asciiflow.com but you could also use excalidraw.com, draw.io, or miro.com

┌────────────────────────────┐
│ MusicPlayer                │
│                            │
│ - add(track)               │
│ - all                      │
│ - search_by_title(keyword) │
│   => [tracks...]           │
└───────────┬────────────────┘
            │ owns a list of
            ▼
┌─────────────────────────┐
│ Track(title, artist)    │
│                         │
│ - title                 │
│ - artist                │
│ - format                │
│   => "TITLE by ARTIST"  │
└─────────────────────────┘
Also design the interface of each class in more detail.
```ruby
class Diary
  def initialize
    # initialises an array for DairyEntry instances
  end

  def add(entry) # entry is an instance of DiaryEntry
    # entry gets added to the entries array
    # Returns nothing
  end

  def read_all
    # Returns all DiaryEntry objects in user friendly format (str)
  end
  
  def find_entry_to_read(wpm, minutes) # wpm and minutes are integers
    # Returns the longest diary entry that can be read within the given time at the given wpm
  end
end

class DiaryEntry
  def initialize(title, body) # title and body are both strings
  end

  def title
    # Returns a string of the title
  end

  def body
    # Returns a string of the body
  end

  def word_count
    # Returns an integer for the number of words in the body
  end

  def reading_time(wpm)
    # Returns an integer for the estimated reading time at the given wpm
  end
end

class Contacts
  def initialize
    # initialises a contacts array to store mobile numbers
  end

  def search
    # searches all diary entries for mobile numbers and adds them to the contacts array
    # does not allow duplicate numbers
  end

  def view
    # displays a user friendly list of all mobile numbers
  end
end

class TodoList
  def initialize
    # initiliases todo_list array for todo items
  end

  def search
    # searches all diary entries for a #TODO tag
    # adds found tagged entries to the todo_list array
  end

  def view
    # displays a user friendly list of todos
  end
end
```
3. Create Examples as Integration Tests
Create examples of the classes being used together in different situations and combinations that reflect the ways in which the system will be used.

# EXAMPLE
```ruby
# Gets all tracks
```
4. Create Examples as Unit Tests
Create examples, where appropriate, of the behaviour of each relevant class at a more granular level of detail.

# EXAMPLE
```ruby
# Constructs a track
track = Track.new("Carte Blanche", "Veracocha")
track.title # => "Carte Blanche"
```
Encode each example as a test. You can add to the above list as you go.

5. Implement the Behaviour
After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour.
