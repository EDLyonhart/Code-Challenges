'''
Author: EDLyonhart
Date 10 October 2016

Challenge Origin: https://github.com/karan/Projects#classic-algorithms
Challenge Description: Sieve of Eratosthenes - 
                        The sieve of Eratosthenes is one of the most efficient 
                        ways to find all of the smaller primes (below 10 million or so).
'''

def remove_from_array(int, arr)

  arr.each_with_index { |e|
    if e%int == 0 && e != int
      arr.delete(e)
    end
  }
  arr
end

def sieve(int)
  arr = [*2..int]
  current_index = 0

  until arr[-1] == arr[current_index]
    remove_from_array(arr[current_index], arr)
    current_index+=1
  end

  p arr
end

sieve(50000)

'''
With the above I decided to separate out concerns.
  1: a method for reducing the array
  2: a method to iterate up through the primes

I ran this on 50,000, and it took ~30 seconds,
so, Im sure it can be optimized
'''