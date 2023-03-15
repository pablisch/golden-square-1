{{PROBLEM}} Method Design Recipe
Copy this into a recipe.md in your project and fill it out.

1. Describe the Problem. User story.

As a user
So that I can improve my grammar
I want to verify that a text starts with a capital letter and ends with a suitable sentence-ending punctuation mark, i.e. full stop, excalmation or question mark.

2. Design the Method Signature. Include the name of the method, its parameters, return value.

Method: check_grammar(text)
Returns: Message indicating that the text is good or what the issue is

Process:
check if first char is capital.
check if last char is . ! or ?
return true if both are true, return false if wither are false.

# The method doesn't print anything or have any other side-effects

3. Create Examples as Tests
   Make a list of examples of what the method will take and return.

<!-- check_grammar("Hello world!") => "Starts with a captial letter and ends with suitable puctuation." -->
<!-- check_grammar("") => "There is no text to check." -->

check_grammar("!") => "There is no text to check."

<!-- check_grammar("hello world!") => "has no starting capital letter." -->
<!-- check_grammar("Hello world") => "Does not end with suitable punctuation." -->

check_grammar("hello world") => "Does not start with a capital letter nor end with suitable punction."

<!-- check_grammar("-hello world-") => "Does not start with a capital letter nor end with suitable punction." -->

check_grammar(" hello world-") => "Does not start with a capital letter nor end with suitable punction."

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
