using MaConSim
using Documenter

DocMeta.setdocmeta!(MaConSim, :DocTestSetup, :(using MaConSim); recursive=true)

makedocs(;
    modules=[MaConSim],
    authors="Ferdinand Campe",
    repo="https://github.com/FBUE687/MaConSim.jl/blob/{commit}{path}#{line}",
    sitename="MaConSim.jl",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        canonical="https://FBUE687.github.io/MaConSim.jl",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/FBUE687/MaConSim.jl",
    devbranch="main",
)
