# 1. Using #each, write the code to find the first sister over four letters in length.
# 2. Once you get the method below to work using #each, refactor your code to use #find. 
require 'pry'
sisters = ["Rose", "Kathleen", "Eunice", "Patricia", "Jean"]

def find_first_long_named_sister(sisters)
    x = nil
    sisters.each do |sister|
        if sister.length > 4
            x = sister
            break
        end
    end
    x
    ### YOUR CODE HERE

    # should return "Kathleen"
end



p find_first_long_named_sister(sisters)
p sisters.find {|x| x.length > 4}