# 1. Using #each, write the code to find all the numbers divisible by 3
# 2. Once you get the method below to work using #each, refactor your code to use #find_all. 
numbers = [1,2,3,4,5,6,7,8,9]

def find_all_nums_divisible_by_3_each(numbers)
    arr = []
    numbers.each do |num|
        arr << num if num % 3 == 0
    end
    arr
    ### YOUR CODE HERE
  
    # should return [3,6,9]
end

p numbers.find_all {|x| x % 3 == 0}

p find_all_nums_divisible_by_3_each(numbers)