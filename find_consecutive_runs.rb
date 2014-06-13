# I wanted to solve this recursively and iteratively because althought the iterative version is
# more simple and easy to read, I may not always be working with a language like ruby that has
# a library of built-in methods like #each_with_index. The recursive solution is more universal

def run?(random_list, index)
  random_list.length > 2 && random_list[index] - random_list[index+1] == -1 && random_list[index+1] - random_list[index+2] == -1 || random_list.length > 2 && random_list[index] - random_list[index+1] == 1  && random_list[index+1] - random_list[index+2] == 1
end

# iteratively
def find_consecutive_runs(random_list)
  starting_points = []

  random_list.each_with_index do |element, index|
  	starting_points << index if run?(random_list, index) if index <= random_list.length - 3
  end

  starting_points unless starting_points.empty?
end


# recursively
def find_consecutive_runs(random_list, starting_points = [], index = 0)
  starting_points << index if run?(random_list, index)

  return nil if index == random_list.length - 3 && starting_points == [] || random_list.length < 3
  return starting_points if index == random_list.length-3

  find_consecutive_runs(random_list, starting_points, index+1)
end

#tests
puts find_consecutive_runs([]) == nil
puts find_consecutive_runs([1]) == nil
puts find_consecutive_runs([1, 2, 3]) == [0]
puts find_consecutive_runs([1, 2, 3, 5, 10, 9, 8, 9, 10, 11, 7]) == [0, 4, 6, 7]
puts find_consecutive_runs([1, 2, 3, 5, 10, 9, 8, 9, 10, 9, 7]) == [0, 4, 6]
