class Contacts
  def view(diary)
    mobiles = []
    diary.entry_list.each { |entry| mobiles << entry.body.scan(/\d{5}\s?\d{6}/) } 
    mobiles.flatten.each { |number| number.insert(5, " ") unless number.include?(" ") }
    fail "There are no mobile numbers to view." if mobiles.empty?
    puts mobiles.flatten.uniq
  end
end