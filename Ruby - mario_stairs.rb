'''
produce a right aligned stair case of "n" height ala Mario.

a "5" input would produce this:

    #
   ##
  ###
 ####
#####
'''


def StairCase(n) 
  count = 1
    
  n.times do
    (n-count).times do print " " end
    count.times do print "#" end
    print "\n"
    count+=1
  end
    
end

StairCase(5)