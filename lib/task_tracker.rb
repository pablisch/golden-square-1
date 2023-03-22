def track_tasks(text)
  fail "No text given." if text.empty?
  text.include?("#TODO")
end