{{PROBLEM}} Method Design Recipe
Copy this into a recipe.md in your project and fill it out.

1. As a user
   So that I can manage my time
   I want to see an estimate of reading time for a text, assuming that I can read 200 words a minute.

2. Design the Method Signature
   Include the name of the method, its parameters, return value, and side effects.

reading_time = estimate_time(text)

text: a string of text inputted as an argument.

Take string input of text
Split string to create array
Find array length
Return array length/200.0

3. Create Examples as Tests
   Make a list of examples of what the method will take and return.

estimate_time("Follow the design recipe to implement the following user stories in your project. User stories follow a specific format don't worry about that too much now, you'll get the hang of it.") => 0.16

estimate_time("Hello world") => 0.01

estimate_time("") => 0.0

estimate_time("Follow the design recipe to implement the following user stories in your project. User stories follow a - specific format don't worry about that too much now, you'll get the hang of it.") => 0.16

estimate_time("Follow the design recipe to implement the following user stories in your project. User stories follow a specific format don't worry about that too much now, you'll get the hang of it. We and our partners store and/or access information on a device, such as cookies and process personal data, such as unique identifiers and standard information sent by a device for personalised ads and content, ad and content measurement, and audience insights, as well as to develop and improve products. With your permission we and our partners may use precise geolocation data and identification through device scanning. You may click to consent to our and our partners’ processing as described above. Alternatively you may click to refuse to consent or access more detailed information and change your preferences before consenting. Please note that some processing of your personal data may not require your consent, but you have a right to object to such processing. Your preferences will apply to this website only. You can change your preferences at any time by returning to this site or visit our privacy policy. We and our partners store and/or access information on a device, such as cookies and process personal data, such as unique identifiers and standard information sent by a device for personalised ads and content, ad and content measurement, and audience insights, as well as to develop and improve products. With your permission we and our partners may use precise geolocation data and identification through device scanning. You may click to consent to our and our partners’ processing as described above. Alternatively you may click to refuse to consent or access more detailed information and change your preferences before consenting. Please note that some processing of your personal data may not require your consent, but you have a right to object to such processing. Your preferences will apply to this website only. You can change your preferences at any time by returning to this site or visit our privacy policy.") => 1.66

4. Implement the Behaviour
   After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour.
