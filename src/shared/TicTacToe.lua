-- Generic Dependencies
local sm  = require(game:GetService("ReplicatedStorage"):WaitForChild("Common"):WaitForChild("ServiceManager"))

-- Specific Dependencies
local TPG = require(sm.RS:WaitForChild("Common"):WaitForChild("TwoPlayerGame"))
local TTT_endConditions = require(sm.RS:WaitForChild("Common"):WaitForChild("TicTacToe_endConditions"))

-- TicTacToe Class
TTT = {}
TTT.__index = TTT

function TTT.new(players, test_matrix)
    local self = setmetatable({}, TTT)

    -- Creates TTT matrix
    self.matrix = test_matrix or {
        {0, 0, 0}, 
        {0, 0, 0}, 
        {0, 0, 0}
    }

    -- Defines team symbol
    self.teams = {
        ["team_x"] = 3,
        ["team_o"] = 7
    }

    self.players = {players[1], players[2]}

    return self
end

local function IsOccupied(matrix, Location)
    if matrix[Location[1]][Location[2]] ~= 0 then
        print(Location[1], Location[2], "is occupied.")
        return true
    end
    return false
end

function TTT:place_mark(Team, Location)
    if not IsOccupied(self.matrix, Location) then
        print(Team.." places on "..tostring(Location[1])..", "..tostring(Location[2]))
        self.matrix[Location[1]][Location[2]] = self.teams[Team]
        return true -- placement successful
    end
    return false -- placement failiure
end

function TTT:game_check() -- Note: true means that the game must end

    local VictoryConditionMet = TTT_endConditions.VictoryConditionMet(self.matrix)
    if VictoryConditionMet then
        print("VictoryConditionMet ==", VictoryConditionMet)
        print(self.matrix)
        return true
    end

    local PlaysLeft = TTT_endConditions.RemainingPlays(self.matrix)
    if not PlaysLeft then
        print("PlaysLeft ==", PlaysLeft)
        return true
    end
end

return TTT