def encode(plaintext, key)
  cipher = key.chars.uniq + (('a'..'z').to_a - key.chars)
  puts "cipher = #{cipher}"
  test_char = plaintext[0]
  puts "first letter is #{test_char}, cipher char stage 1 is #{cipher.find_index(test_char)}, cipher char class is #{(cipher.find_index(test_char)).class}."
  ciphertext_chars = plaintext.chars.map do |char|
    # puts "char is #{char} and cipher index is '#{(cipher.find_index(char))}'" 
    # puts "new ciphertext_char is... '#{(65 + cipher.find_index(char)).chr}'"
    (65 + cipher.find_index(char)).chr
    # binding.irb
  end
  puts "ciphertext_chars = #{ciphertext_chars}"
  return ciphertext_chars.join
end

def decode(ciphertext, key)
  cipher = key.chars.uniq + (('a'..'z').to_a - key.chars)
  puts "cipher = #{cipher}"
  plaintext_chars = ciphertext.chars.map do |char|
    puts "#{char} becomes #{cipher[65 - char.ord]}"
    puts "65 - char.ord = #{65 - char.ord}"
    cipher[char.ord - 65]
  end
  return plaintext_chars.join
end

p encode("theswiftfoxjumpedoverthelazydog", "secretkey")
puts
p decode("EMBAXNKEKSYOVQTBJSWBDEMBPHZGJSL", "secretkey")

# Intended output:
#
# > encode("theswiftfoxjumpedoverthelazydog", "secretkey")
# => "EMBAXNKEKSYOVQTBJSWBDEMBPHZGJSL"
#
# > decode("EMBAXNKEKSYOVQTBJSWBDEMBPHZGJSL", "secretkey")
# => "theswiftfoxjumpedoverthelazydog"