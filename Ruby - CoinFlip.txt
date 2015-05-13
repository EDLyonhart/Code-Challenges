def coinFlip number
  number.times do |flip|
    x =  rand(1..2)
    x.even? ? puts “heads” : puts “tails”
  end
end

coinFlip(15)


//This generates a number between 1 and 2 (inclusive). If the number is even (2), the output will be 'heads', otherwise, if the number is odd (1), the output will be 'tails'. Repeat this however many times are specified.