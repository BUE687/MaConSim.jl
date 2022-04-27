mutable struct Robot <: AbstractAgent
    id::Int
    name::String
end

mutable struct ChannelModel
    properties::String
end

mutable struct MaConModel
    agent_model::ABM
    comunication_network::MetaGraph
end

function MaConModel(; RobotModel::Type{<:Robot}, ChannelModel::Type{<:ChannelModel})
    agent_model = AgentBasedModel(RobotModel)
    comunication_network = MetaGraph(
        DiGraph(),
        VertexData=RobotModel,
        EdgeData=ChannelModel,
    )
    MaConModel(agent_model, comunication_network)
end

function rem_edge!(model::MaConModel, from::String, to::String)
    list_of_keys = sort!(OrderedDict(model.comunication_network.vertex_labels))
    ind_from = findfirst(x->x == Symbol(from), list_of_keys)
    ind_to = findfirst(x->x == Symbol(to), list_of_keys)
    delete!(model.comunication_network.edge_data, (from, to))
    rem_edge!(model.comunication_network.graph, ind_from, ind_to)
end

function add_agent_to_model!(
        model::MaConModel,
        robot::Robot
    )
    add_agent!(robot, model.agent_model)
    model.comunication_network[Symbol(robot.name)] = robot
end

function add_channel!(model::MaConModel, from::String, to::String, channel::ChannelModel)
    model.comunication_network[Symbol(from), Symbol(to)] = channel
end
