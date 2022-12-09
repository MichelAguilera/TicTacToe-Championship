-- Generic Dependencies
local sm  = require(game:GetService("ReplicatedStorage"):WaitForChild("Common"):WaitForChild("ServiceManager"))

-- Specific Dependencies

-- Functions
TTTf = {}

---- REMAINING PLAYS ----

function TTTf.RemainingPlays(matrix)
    local remaining_plays = {}
    for i, _ in pairs(matrix) do
        for _, col in pairs(matrix[i]) do
            if col == 0 then
                table.insert(remaining_plays, true)
            else
                table.insert(remaining_plays, false)
            end
        end
    end
    
    print(remaining_plays)

    for _, v in pairs(remaining_plays) do
        if v == true then
            return true
        end
    end

    return false
end

---- VICTORY CONDITIONS ----

local function SumCheck(sum)
    if sum % 3 == 0 and sum == 9 then
    --  print("sum % 3 == 0 and sum == 9")
        return true
    elseif sum % 7 == 0 and sum == 21 then
    --  print("sum % 7 == 0 and sum == 21")
        return true
    else
    --  print("sum disqualified")
        return false
    end
end

local function HorizontalCheck(matrix)
    local check = {}
    for i, _ in pairs(matrix) do
        local sum = 0
        for _, col in pairs(matrix[i]) do
            sum += col
        end
        check[i] = SumCheck(sum)
    end
    for _, v in pairs(check) do
        if v == true then
	        return true
        end
    end
    return false
end

local function VerticalCheck(matrix)
    local iter = 0
	local check = {}
    while iter < 3 do
        local sum = 0
        for i, _ in pairs(matrix) do
            sum += matrix[i][iter + 1]
        end
        check[iter] = SumCheck(sum)
        iter += 1
    end
    for _, v in pairs(check) do
        if v == true then
	        return true
        end
    end
    return false
end

local function DiagonalPositiveCheck(matrix)
    local sum = matrix[3][1] + matrix[2][2] + matrix[1][3]
    return SumCheck(sum)
end

local function DiagonalNegativeCheck(matrix)
    local sum = matrix[1][1] + matrix[2][2] + matrix[3][3]
    return SumCheck(sum)
end

function TTTf.VictoryConditionMet(matrix)

    local check_list = {
        HorizontalCheck(matrix),
        VerticalCheck(matrix),
        DiagonalPositiveCheck(matrix),
        DiagonalNegativeCheck(matrix)
    }

    for _, v in pairs(check_list) do
        if v == true then
            return true
        end
    end
    return false

end

return TTTf