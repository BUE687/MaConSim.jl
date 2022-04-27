using MaConSim
using Test

@testset "MaConSim.jl" begin
    # Write your tests here.
    @testset "Models" begin
        # run test
        @test isa(MaConModel(RobotModel=Robot, ChannelModel=ChannelModel), MaConModel)

        model = MaConModel(RobotModel=Robot, ChannelModel=ChannelModel)

        robot = Robot(0, "Allice")

        add_agent_to_model!(model, robot)

        @test nagents(model.agent_model) == 1

        @test nv(model.comunication_network) == 1

        robot = Robot(1, "Bob")

        add_agent_to_model!(model, robot)

        @test nagents(model.agent_model) == 2

        @test nv(model.comunication_network) == 2

        @test ne(model.comunication_network) == 0

        model.comunication_network[:Simon, :Hans] = ChannelModel("Da")

        #comunication_network[:Hans, :Simon] = ChannelModel("Hier")

        #rem_edge!(comunication_network, :Hans, :Simon)

        @test 1==1
    end
end
