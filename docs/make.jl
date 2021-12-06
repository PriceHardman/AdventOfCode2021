using Documenter, AdventOfCode2021

makedocs(
    modules = [AdventOfCode2021],
    format = Documenter.HTML(; prettyurls = get(ENV, "CI", nothing) == "true"),
    authors = "Price Hardman",
    sitename = "AdventOfCode2021.jl",
    pages = Any["index.md"]
    # strict = true,
    # clean = true,
    # checkdocs = :exports,
)

deploydocs(
    repo = "github.com/PriceHardman/AdventOfCode2021.jl.git",
    push_preview = true
)
