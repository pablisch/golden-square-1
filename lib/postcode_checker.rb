def check_postcode postcode_string
  postcode_string.match? /^[A-Z]{1,2}\d{1,2}[A-Z]?\s\d[A-Z][A-Z]$/
end

p check_postcode "AA9A 9AA"
p check_postcode "AA99A 9AA"
p check_postcode "A9A 9AA"
p check_postcode "AA9 9AA"
p check_postcode "AA99 9AA"
p check_postcode "A9 9AA"
puts
p check_postcode "AAAAAA9A 9AA"
p check_postcode "AAA9A 9AA"
p check_postcode "AA999 9AA"
p check_postcode "AA9A AA"
p check_postcode "AA9A A9"
puts