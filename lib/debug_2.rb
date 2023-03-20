def encode(plaintext, key)
  # cipher is an array containing the unique letters of the encryption key plus the other letters of the alphabet in order
  # Using binding.irb to check the value of the char from plaintext that was causing the program to throw an error, I realised 'z' was not included in the cipher array
  # This is because of the three dot syntax that was used to specify a range of chars (should be two dots)
  cipher = key.chars.uniq + (('a'..'z').to_a - key.chars)
  # i = 1
  # puts "The length of plaintext.chars is #{plaintext.chars.length}"
  # puts plaintext.chars[26]
  ciphertext_chars = plaintext.chars.map do |char|
    # puts "The value of cipher.find_index(char) is #{cipher.find_index(char)}, the value of is char #{i} is #{(65 + cipher.find_index(char)).chr}"
    (65 + cipher.find_index(char)).chr
    # i+= 1
    # binding.irb
  end
  return ciphertext_chars.join
end

def decode(ciphertext, key)
  cipher = key.chars.uniq + (('a'..'z').to_a - key.chars)
  plaintext_chars = ciphertext.chars.map do |char|
    # cipher[65 - char.ord]
    # Needed to rephrase this line to decode correctly
    cipher[char.ord - 65]
  end
  return plaintext_chars.join
end

puts encode("theswiftfoxjumpedoverthelazydog", "secretkey")

puts "EMBAXNKEKSYOVQTBJSWBDEMBPHZGJSL"

puts decode("EMBAXNKEKSYOVQTBJSWBDEMBPHZGJSL", "secretkey")
# Intended output:
#
# > encode("theswiftfoxjumpedoverthelazydog", "secretkey")
# => "EMBAXNKEKSYOVQTBJSWBDEMBPHZGJSL"
#
# > decode("EMBAXNKEKSYOVQTBJSWBDEMBPHZGJSL", "secretkey")
# => "theswiftfoxjumpedoverthelazydog"
