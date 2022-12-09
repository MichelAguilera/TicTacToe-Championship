-- Generic Dependencies
local sm  = require(game:GetService("ReplicatedStorage"):WaitForChild("Common"):WaitForChild("ServiceManager"))

-- Specific Dependencies
local TTT = require(sm.RS:WaitForChild("Common"):WaitForChild("TicTacToe"))

-- Main
local test_matrix = {
    {7, 7, 3},
    {7, 0, 0},
    {7, 3, 7}
}

local round = TTT.new({"foo", "bar"}
    -- , test_matrix
)

print("Loop starting...")
while wait(1) do

    print("Team x placing...")
    while not round:place_mark("team_x", {math.random(1, 3), math.random(1, 3)}) do wait(0.5); continue end

    if round:game_check() then break end -- Needs to be FALSY statment to end the loop

    wait(1)

    print("Team o placing...")
    while not round:place_mark("team_o", {math.random(1, 3), math.random(1, 3)}) do wait(0.5); continue end

    if round:game_check() then break end -- Needs to be FALSY statment to end the loop
end