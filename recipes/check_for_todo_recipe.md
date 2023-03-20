## Describe the Problem

> As a user

> So that I can keep track of my tasks

> I want to check if a text includes the string #TODO.

## Design the Method Signature

`result = check_for_todo(text)`

text = a string of any length to be checked

result = a boolean value indicating whether '#TODO' is present in the text

check_for_todo('') => fail "does not contain any text"
check_for_todo('hello') => false
check_for_todo('#TODO') => true
check_for_todo('hello, world') => false
check_for_todo('hello, #TODO') => true
check_for_todo('#TODO hi there world!') => true
check_for_todo('message: #TODO hi there world!') => true
