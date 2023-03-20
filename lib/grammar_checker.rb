def check_grammar(text)
  first_char = text.chars.first
  last_char = text.chars.last
  # if first_char == first_char.upcase && (last_char == '.' || last_char == '?' || last_char == '!')
  if (first_char.match(/[A-Z]/)) && (last_char.match(/[!?.]/))
    true
  else
    false
  end
end