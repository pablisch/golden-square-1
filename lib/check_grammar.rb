def check_grammar(text)
  return "There is no text to check." if text.length == 0
  capital = text[0] !~ /[A-Z]/ ? "no" : "yes"

  return "Starts with a captial letter and ends with suitable puctuation." if capital == "yes"
  "Has no starting capital letter."
  
end