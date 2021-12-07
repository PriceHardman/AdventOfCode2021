module Day1

import DelimitedFiles

# https://adventofcode.com/2021/day/1
# To do this, count the number of times a depth measurement increases from the previous measurement. 
# (There is no measurement before the first measurement.) 
# In the example above, the changes are as follows:

# 199 (N/A - no previous measurement)
# 200 (increased)
# 208 (increased)
# 210 (increased)
# 200 (decreased)
# 207 (increased)
# 240 (increased)
# 269 (increased)
# 260 (decreased)
# 263 (increased)
# In this example, there are 7 measurements that are larger than the previous measurement.

# How many measurements are larger than the previous measurement?

function num_increases(x::Vector{Int64})
    return sum(x[i] > x[i-1] for i=2:length(x))
end

function num_3_window_increases(x::Vector{Int64})
    count = 0
    for i = 2:(length(x)-2)
        previous_window = x[i-1:i+1]
        this_window = x[i:i+2]
        if sum(this_window) > sum(previous_window)
            count += 1
        end
    end
    return count
end

function read_input()
    input_filepath = joinpath(@__DIR__, "input.txt")
    return DelimitedFiles.readdlm(input_filepath, ',', Int64, '\n')[:,1]
end

function part1_answer()
    return num_increases(read_input())
end

function part2_answer()
    return num_3_window_increases(read_input())
end

end