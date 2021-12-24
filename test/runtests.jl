using AdventOfCode2021
using Test

@testset "Day 1" begin
    @test AdventOfCode2021.Day1.num_increases([199,200,208,210,200,207,240,269,260,263]) == 7
    @test AdventOfCode2021.Day1.part1_answer() == 1564
    @test AdventOfCode2021.Day1.num_3_window_increases([199,200,208,210,200,207,240,269,260,263]) == 5
    @test AdventOfCode2021.Day1.part2_answer() == 1611
end

@testset "Day 2" begin
    course = [
        "forward" 5;
        "down" 5;
        "forward" 8;
        "up" 3;
        "down" 8;
        "forward" 2
    ]
    @test AdventOfCode2021.Day2.calculate_position_and_depth(course) == (15,10)
    @test AdventOfCode2021.Day2.part1_answer() == 1962940
    @test AdventOfCode2021.Day2.calculate_position_and_depth_with_aim(course) == (15, 60)
    @test AdventOfCode2021.Day2.part2_answer() == 1813664422
end

@testset "Day 3" begin

    diagnostics = [
        0 0 1 0 0
        1 1 1 1 0
        1 0 1 1 0
        1 0 1 1 1
        1 0 1 0 1
        0 1 1 1 1
        0 0 1 1 1
        1 1 1 0 0
        1 0 0 0 0
        1 1 0 0 1
        0 0 0 1 0
        0 1 0 1 0
    ]
    @test AdventOfCode2021.Day3.calculate_gamma_and_epsilon_rates(diagnostics) == (22, 9)
    @test AdventOfCode2021.Day3.part1_answer() == 2583164
    @test AdventOfCode2021.Day3.calculate_oxygen_and_co2_ratings(diagnostics) == (23, 10)
    @test AdventOfCode2021.Day3.part2_answer() == 2784375
end

@testset "Day 4" begin
    input = [
        "7,4,9,5,11,17,23,2,0,14,21,24,10,16,13,6,15,25,12,22,18,20,8,19,3,26,1"
        ""
        "22 13 17 11  0"
        " 8  2 23  4 24"
        "21  9 14 16  7"
        " 6 10  3 18  5"
        " 1 12 20 15 19"
        ""
        " 3 15  0  2 22"
        " 9 18 13 17  5"
        "19  8  7 25 23"
        "20 11 10 24  4"
        "14 21 16 12  6"
        ""
        "14 21 17 24  4"
        "10 16 15  9 19"
        "18  8 23 26 20"
        "22 11 13  6  5"
        " 2  0 12  3  7"
    ]
end