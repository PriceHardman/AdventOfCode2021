module Day3

function read_input(filepath)
    # Parse the file into a 1000x12 matrix of Ints
    lines = readlines(filepath)
    n_rows = length(lines)
    n_cols = length(lines[1])
    A = zeros(Int64, (n_rows, n_cols))
    for row = 1:n_rows
        for col = 1:n_cols
            A[row,col] = parse(Int64, lines[row][col])
        end
    end
    
    return A
end

function calculate_gamma_and_epsilon_rates(diagnostics::Matrix{Int64})
    column_sums = sum(diagnostics, dims=1)
    n_rows = size(diagnostics)[1]
    gamma_rate_binary = string("0b", join(Int(i >= n_rows/2) for i in column_sums))
    epsilon_rate_binary = string("0b", join(Int(i < n_rows/2) for i in column_sums))
    
    gamma_rate_decimal = parse(Int, gamma_rate_binary)
    epsilon_rate_decimal = parse(Int, epsilon_rate_binary)

    return (gamma_rate_decimal, epsilon_rate_decimal)
end

function calculate_oxygen_and_co2_ratings(diagnostics::Matrix{Int64})
    # To calculate the oxygen rating:
    # Start with the 1st column, determining the most common number in the column (tie goes to 1)
    # Discard all rows whose bit in this column are not that number.
    # Do we have only 1 row left? If not, move to the next column and repeat until we have only 1 row remaining.
    # if we cycle through all columns, start again

    n_cols = size(diagnostics)[2]

    # Calculate oxygen rating
    oxygen_rating_binary = begin
        candidates = diagnostics
        n_iter = 0
        while size(candidates)[1] > 1
            current_column = (n_iter % n_cols) + 1 # so that we can cycle through the columns indefinitely 1,2,...,n_cols,1,2,...
            
            n_rows = size(candidates)[1] # current number of rows remaining
            n_ones_in_column = sum(candidates[:, current_column])
            most_common_value_in_column = (n_ones_in_column / n_rows) >= 0.5 ? 1 : 0
    
            # Filter candidates matrix further to only include rows where current column contains most common bit
            candidates = candidates[candidates[:, current_column] .== most_common_value_in_column, :]
    
            n_iter += 1
        end
        join(candidates[1,:]) # collapse the lone remaining row into a string
    end
    
    # Calculate co2 rating
    co2_rating_binary = begin
        candidates = diagnostics
        n_iter = 0
        while size(candidates)[1] > 1
            current_column = (n_iter % n_cols) + 1 # so that we can cycle through the columns indefinitely 1,2,...,n_cols,1,2,...
            
            n_rows = size(candidates)[1] # current number of rows remaining
            n_ones_in_column = sum(candidates[:, current_column])
            least_common_value_in_column = (n_ones_in_column / n_rows) < 0.5 ? 1 : 0
    
            # Filter candidates matrix further to only include rows where current column contains most common bit
            candidates = candidates[candidates[:, current_column] .== least_common_value_in_column, :]
    
            n_iter += 1
        end
        join(candidates[1,:]) # collapse the lone remaining row into a string
    end
    
    oxygen_rating_decimal = parse(Int, string("0b", oxygen_rating_binary))
    co2_rating_decimal = parse(Int, string("0b", co2_rating_binary))
    return (oxygen_rating_decimal, co2_rating_decimal)
end

function part1_answer()
    diagnostics = read_input(joinpath(@__DIR__, "input.txt"))
    (γ, ϵ) = calculate_gamma_and_epsilon_rates(diagnostics)
    return γ * ϵ
end

function part2_answer()
    diagnostics = read_input(joinpath(@__DIR__, "input.txt"))
    (o2, co2) = calculate_oxygen_and_co2_ratings(diagnostics)
    return o2 * co2
end

end