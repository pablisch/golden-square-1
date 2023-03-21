{{PROBLEM}} Class Design Recipe

1. Describe the Problem
   Put or write the user story here. Add any clarifying notes you might have.

```ruby
# Already provided with class outlines
```

2. Design the Class Interface
   Include the initializer and public methods with all parameters and return values.

```ruby
class Diary
  def initialize
  end

  def add(entry) # entry is an instance of DiaryEntry
    # Returns nothing
  end

  def all
    # Returns a list of instances of DiaryEntry
  end

  def count_words
    # Returns the number of words in all diary entries
    # HINT: This method should make use of the `count_words` method on DiaryEntry.
  end

  def reading_time(wpm) # wpm is an integer representing
                        # the number of words the user can read per minute
    # Returns an integer representing an estimate of the reading time in minutes
    # if the user were to read all entries in the diary.
  end

  def find_best_entry_for_reading_time(wpm, minutes)
        # `wpm` is an integer representing the number of words the user can read
        # per minute.
        # `minutes` is an integer representing the number of minutes the user
        # has to read.
    # Returns an instance of diary entry representing the entry that is closest
    # to, but not over, the length that the user could read in the minutes they
    # have available given their reading speed.
  end
end

class DiaryEntry
  def initialize(title, contents) # title, contents are strings
    # ...
  end

  def title
    # Returns the title as a string
  end

  def contents
    # Returns the contents as a string
  end

  def count_words
    # Returns the number of words in the contents as an integer
  end

  def reading_time(wpm) # wpm is an integer representing
                        # the number of words the user can read per minute
    # Returns an integer representing an estimate of the reading time in minutes
    # for the contents at the given wpm.
  end

  def reading_chunk(wpm, minutes) # `wpm` is an integer representing the number
                                  # of words the user can read per minute
                                  # `minutes` is an integer representing the
                                  # number of minutes the user has to read
    # Returns a string with a chunk of the contents that the user could read
    # in the given number of minutes.
    # If called again, `reading_chunk` should return the next chunk, skipping
    # what has already been read, until the contents is fully read.
    # The next call after that it should restart from the beginning.
  end
end
```
## Notes of functionality:
```ruby
diary.add(entry) adds an entry (a << s)
diary.all returns a list (a)
diary.count_words returns the count of all words # USING diary_entry.count_words
diary.reading_time(wpm) returns (i) estimated reading time for the entire diary
dairy.find_best_entry_for_reading_time(wpm, minutes) returns diary entry that is readable within given reading time but closest to filling it (s)

diary_entry.initialize(title, contents) initialises entry with title and contents
diary_entry.title returns the title (s)
diary_entry.contents returns the contents (s)
diary_entry.count_words returns the number of words in the contents (i)
diary_entry.reading_time(wpm) returns the estimated reading time for contents (i)
diary_entry.reading_chunk(wpm, minutes) returns a chunk of the contents readable in the time given. If called again, will return the next chunk, restarting when the contents is fully read. (s)


```
3. Create Examples as Tests
   Make a list of examples of how the class will behave in different situations.
## diary ONLY
```ruby
diary = Diary.new
diary.all # => []
```
## dairy_entry ONLY
```ruby
entry = DiaryEntry.new("", ("I need some more sleep ") * 10) # => fail "No title."

entry = DiaryEntry.new("Monday", "") # => fail "No contents."

entry = DiaryEntry.new("Monday", ("I need some more sleep ") * 10)
entry.title # => "Monday"

entry = DiaryEntry.new("Tuesday", ("I need some more sleep ") * 10)
entry.title # => "Tuesday"

entry = DiaryEntry.new("Monday", ("I need some more sleep ") * 1)
entry.contents # => "I need some more sleep "

entry = DiaryEntry.new("Monday", ("I need some more food ") * 1)
entry.contents # => "I need some more food "

entry = DiaryEntry.new("Monday", ("I need some more food ") * 1)
entry.count_words # => 5

entry = DiaryEntry.new("Monday", ("I need some more food ") * 2)
entry.count_words # => 10

entry = DiaryEntry.new("Monday", ("I need some more food ") * 1)
entry.reading_time(10) # => 1

entry = DiaryEntry.new("Monday", ("I need some more food ") * 2)
entry.reading_time(10) # => 1

entry = DiaryEntry.new("Monday", ("I need some more food ") * 3)
entry.reading_time(10) # => 2

entry = DiaryEntry.new("Monday", ("I need some more food ") * 3)
entry.reading_chunk(3, 2) # => "I need some more food I"

entry = DiaryEntry.new("Monday", ("I need some more food ") * 3)
entry.reading_chunk(3, 2)
entry.reading_chunk(3, 2) # => "need some more food I need some"

entry = DiaryEntry.new("Monday", ("I need some more food ") * 1)
entry.reading_chunk(3, 2)
entry.reading_chunk(3, 2) # => "I need some more food"


```
## INTEGRATION
```ruby
diary = Diary.new
diary_entry_1 = DiaryEntry.new("Title", "1 2 3 4 5")
diary_entry_2 = DiaryEntry.new("Title2", "A B C D E")
diary.add(diary_entry_1)
diary.add(diary_entry_2)
diary.all # => [diary_entry_1, diary_entry_2]

diary = Diary.new
diary_entry_1 = DiaryEntry.new("Title", "1 2 3 4 5")
diary_entry_2 = DiaryEntry.new("Title2", "A B C D E")
diary.add(diary_entry_1)
diary.add(diary_entry_2) 
diary.count_words # => 10


diary = Diary.new
diary_entry_1 = DiaryEntry.new("Title", "1 2 3 4 5")
diary_entry_2 = DiaryEntry.new("Title2", "A B C D E")
diary.add(diary_entry_1)
diary.add(diary_entry_2)
diary.reading_time(4) # => 3

diary = Diary.new
diary_entry_1 = DiaryEntry.new("Title", "1 2 3 4 5")
diary_entry_2 = DiaryEntry.new("Title2", "A B C D E F G H I J")
diary.add(diary_entry_1)
diary.add(diary_entry_2)
diary.find_best_entry_for_reading_time(4, 2) # => diary_entry_1

diary = Diary.new
diary_entry_1 = DiaryEntry.new("Title", "1 2 3 4 5")
diary_entry_2 = DiaryEntry.new("Title2", "A B C D E F G H I J")
diary.add(diary_entry_1)
diary.add(diary_entry_2)
diary.find_best_entry_for_reading_time(4, 1) # => fail "There are not entries that you can read in 1 minutes."

```


4. Implement the Behaviour
   After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour.




