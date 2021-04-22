COLORS = [1, 2, 3, 4, 5, 6]

def generate_secret_code
  secret_code = []
  0.upto(3) { secret_code << COLORS.sample }
  secret_code
end

puts generate_secret_code