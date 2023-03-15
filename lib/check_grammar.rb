def check_grammar(text)
  return "There is no text to check." if text.length == 0
  capital = text[0] !~ /[A-Z]/ ? "no" : "yes"
  ending = text[-1] !~ /[^\.!?]/ ? "yes" : "no" 

  if capital == "yes" and ending == "yes"
    "Starts with a captial letter and ends with suitable puctuation."
  elsif capital == "yes"
    "Does not end with suitable punctuation."
  elsif ending == "yes"
    "Has no starting capital letter."
  end  
end