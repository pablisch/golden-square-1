def make_snippet(str)
  arr = str.split 
  if arr.size < 6
    return arr.join(" ")
  end
  "#{arr[0,5].join(" ")}..."
end