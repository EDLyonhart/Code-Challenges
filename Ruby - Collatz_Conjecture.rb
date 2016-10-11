'''
Author: EDLyonhart
Date: 10 October 2016

Challenge Origin: https://github.com/karan/Projects#classic-algorithms
Challenge Description: Collatz Conjecture - 
                        Start with a number n > 1. 
                        Find the number of steps it takes to reach one using the following process: 
                          If n is even, divide it by 2. 
                          If n is odd, multiply it by 3 and add 1.
'''

def conjecture(int, steps)

  if int == 1
    p steps
  elsif int % 2 == 0
    steps+=1
    int = int/2
    conjecture(int, steps)
  else
    steps+=1
    int = (int*3)+1
    conjecture(int, steps)
  end
end

int = ARGV[0].to_i
steps = 0

conjecture(int, steps)