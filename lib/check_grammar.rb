def check_grammar(text)
  return "There is no text to check." if text.length == 0
  capital = text[0] == text[0].upcase ? "yes" : "no"

  return "Starts with a captial letter and ends with suitable puctuation." if capital == "yes"
  "Has no starting capital letter."
  
end