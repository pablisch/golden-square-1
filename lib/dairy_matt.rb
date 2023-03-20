def reading_chunk(wpm, minutes)
  string_to_return = @contents[@counter...@counter+(wpm * minutes)].join(" ")
  if @counter + (wpm * minutes) >= @contents.length
    @counter = 0
  else
    @counter += (wpm * minutes)
  end
  return string_to_return
end