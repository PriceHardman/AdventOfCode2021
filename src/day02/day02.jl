module Day2

import DelimitedFiles

function read_input(filepath)
    return DelimitedFiles.readdlm(filepath, ' ', '\n')
end


function calculate_position_and_depth(course)
    position = 0
    depth = 0
    for row = 1:(size(course)[1])
        direction = course[row, 1]
        magnitude = course[row, 2]
        if direction == "forward"
            position += magnitude
        elseif direction == "up"
            depth -= magnitude
        elseif direction == "down"
            depth += magnitude
        end
    end
    return (position, depth)
end

function part1_answer()
    input_filepath = joinpath(@__DIR__, "input.txt")
    position, depth = calculate_position_and_depth(read_input(input_filepath))
    return position * depth
end

function calculate_position_and_depth_with_aim(course)
    position = 0
    depth = 0
    aim = 0
    for row = 1:(size(course)[1])
        direction = course[row, 1]
        magnitude = course[row, 2]
        if direction == "forward"
            position += magnitude
            depth += aim*magnitude
        elseif direction == "up"
            aim -= magnitude
        elseif direction == "down"
            aim += magnitude
        end
    end
    return (position, depth)
end

function part2_answer()
    input_filepath = joinpath(@__DIR__, "input.txt")
    position, depth = calculate_position_and_depth_with_aim(read_input(input_filepath))
    return position * depth
end

end