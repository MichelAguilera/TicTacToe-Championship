-- Generic Dependencies
local sm  = require(game:GetService("ReplicatedStorage"):WaitForChild("Common"):WaitForChild("ServiceManager"))

-- Specific Dependencies
local Roact = require(sm.RS:WaitForChild("Common"):WaitForChild("Roact").src)
local Style = require(sm.RS:WaitForChild("Common"):WaitForChild("UI_Styles").main)

local multiplier = 10
----------------------------------------------------------------

local function TTT_Box(props)
    return Roact.createElement("Frame", {
        Name = "TTT_Box",
        -- Position = UDim2.new(0, props.x, 0, props.y),
        Position = props.Tag.Frame.Position,
        Size = UDim2.new(0, 50, 0, 50),
        AnchorPoint = Vector2.new(0.5, 0.5)
    }, {
        Roact.createElement("TextButton", {
            Name = "btn",
            Position = UDim2.new(0.5, 0, 0.5, 0),
            Size = UDim2.new(1, 0, 1, 0),
            AnchorPoint = Vector2.new(0.5, 0.5),
            Transparency = 1
        })
    })
end

local function TTT_UI(props)
    return Roact.createElement("Frame", {
        Name = "Fillscreen_Frame",
        -- Position = UDim2.new(0.5, 0, 0.5, 0),
        -- Size = UDim2.new(2, 0, 2, 0),
        -- AnchorPoint = Vector2.new(0.5, 0.5),
        Position = props.Tag.Frame.Position,
        Size = props.Tag.Frame.Size,
        AnchorPoint = props.Tag.Frame.AnchorPoint,
        Transparency = props.Tag.Frame.Transparency or 0.5,
        BackgroundColor3 = props.Tag.Frame.BackgroundColor3
    }, {
        Roact.createElement("Frame", {
            Name = "TTT_Frame",
            Position = UDim2.new(0.5, 0, 0.5, 0),
            Size = UDim2.new(0.5/2, 0, 0.5/2, 0),
            AnchorPoint = Vector2.new(0.5, 0.5)
        }, {
            -- for loop every slot
        })
    })

end


-- RUN
local app = Roact.createElement("ScreenGui", {}, {TTT_UI(Style)})

Roact.mount(app, sm.PS.LocalPlayer.PlayerGui)