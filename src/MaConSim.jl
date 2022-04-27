module MaConSim

using Agents
using Graphs
using MetaGraphsNext
using GraphPlot
using OrderedCollections
import Graphs.SimpleGraphs.rem_edge!

include("model.jl")

export Robot
export ChannelModel
export MaConModel
export add_channel!
export rem_edge!
export add_agent_to_model!
# Write your package code here.

end
