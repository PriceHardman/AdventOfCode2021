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