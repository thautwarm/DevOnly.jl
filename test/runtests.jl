using Test
using DevOnly

@testset "check api" begin
    @staticinclude("example.jl")
    @test isdevonly() == false
    @test (@devonly using MLStyle) == nothing
    @test f(1) == :one
    @test f(2) == :other
end

