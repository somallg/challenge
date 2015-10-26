@h = Hash.new
@h[0] = @h[1] = 1

def fact(n)
  @h[n] ||= n * fact(n - 1)
end


puts fact(10)