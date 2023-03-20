class GrammarStats
  def initialize
    @checks = 0
    @passes = 0.0
  end

  def check(text) 
    fail "No text to check." if text.empty?
    @checks += 1
    if text.match? /[\.!?]$/ and text.match? /^[A-Z]/
      @passes += 1
      true
    else
      false
    end
  end

  def percentage_good
    puts "#{@passes} passes and #{@checks} checks."
    fail "No tests have been carried out yet." if @checks == 0
    return 0 if @passes == 0
    ((@passes / @checks) * 100).to_i
  end
end