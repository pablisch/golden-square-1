## Describe the problem

> As a user
> 
> So that I can improve my grammar
> 
> I want to verify that a text starts with a capital letter and ends with a suitable sentence-ending punctuation mark.

- 

## Design the Method Signature

`result = check_grammar(text)`

text: a string, the text to be checked for correct punctutaion

reading_time = a bool, true only if the text starts with a capital letter and ends with either of `. ? !`


## Create Examples as Tests

check_grammar("Hello.") => true
check_grammar("Hello world.") => true
check_grammar("Hello?") => true
check_grammar("Hello!") => true
check_grammar("Hello there world?") => true
check_grammar("Hello there, world!") => true
check_grammar("Hello") => false
check_grammar("hello.") => false
check_grammar("hello there world?") => false
check_grammar("hello there, world!") => false
check_grammar("the rain in spain...") => false
check_grammar("Falls mainly on the plain...") => true
check_grammar("...And so on...") => false
check_grammar("1234 Five o clock rock.") => false


