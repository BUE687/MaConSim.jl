using MaConSim
using Test
using Graphs
using Agents

@testset "MaConSim.jl" begin
    # Write your tests here.
    @testset "Models" begin
        # run test
        @test isa(MaConModel(RobotModel=Robot, ChannelModel=ChannelModel), MaConModel)

        model = MaConModel(RobotModel=Robot, ChannelModel=ChannelModel)

        @test isa(model, MaConModel)

        robot = Robot(0, "Alice")

        add_agent_to_model!(model, robot)

        @test nagents(model.agent_model) == 1

        @test nv(model.comunication_network) == 1

        robot = Robot(1, "Bob")

        add_agent_to_model!(model, robot)

        @test nagents(model.agent_model) == 2

        @test nv(model.comunication_network) == 2

        @test ne(model.comunication_network) == 0

        add_edge!(model, "Alice", "Bob", ChannelModel("Hier"))

        @test ne(model.comunication_network) == 1

        add_edge!(model, "Bob", "Alice", ChannelModel("Da"))

        @test ne(model.comunication_network) == 2

        rem_edge!(model, "Alice", "Bob")

        @test ne(model.comunication_network) == 1

        rem_edge!(model, "Bob", "Alice")

        @test ne(model.comunication_network) == 0

        #@test 1==1
    end
end
