-- Developed by [Sunwurp]

local function createESP(player)
    if player == game.Players.LocalPlayer then
        return
    end

    local billboardGui = Instance.new("BillboardGui")
    billboardGui.Name = "PlayerESP"
    billboardGui.AlwaysOnTop = true
    billboardGui.Size = UDim2.new(0, 100, 0, 40)
    billboardGui.StudsOffset = Vector3.new(0, 3, 0)

    local nameLabel = Instance.new("TextLabel", billboardGui)
    nameLabel.Name = "NameLabel"
    nameLabel.Size = UDim2.new(1, 0, 0.5, 0)
    nameLabel.Position = UDim2.new(0, 0, 0, 0)
    nameLabel.BackgroundTransparency = 1
    nameLabel.Text = player.Name
    nameLabel.TextColor3 = Color3.new(1, 1, 1)
    nameLabel.TextScaled = true

    local healthLabel = Instance.new("TextLabel", billboardGui)
    healthLabel.Name = "HealthLabel"
    healthLabel.Size = UDim2.new(1, 0, 0.5, 0)
    healthLabel.Position = UDim2.new(0, 0, 0.5, 0)
    healthLabel.BackgroundTransparency = 1
    healthLabel.Text = "Health: " .. player.Character.Humanoid.Health
    healthLabel.TextColor3 = Color3.new(1, 0, 0)
    healthLabel.TextScaled = true

    billboardGui.Parent = player.Character.Head
end

for _, player in ipairs(game.Players:GetPlayers()) do
    createESP(player)
end

game.Players.PlayerAdded:Connect(function(player)
    createESP(player)
end)

game:GetService("RunService").Stepped:Connect(function()
    for _, player in ipairs(game.Players:GetPlayers()) do
        if player ~= game.Players.LocalPlayer then
            local billboardGui = player.Character and player.Character:FindFirstChild("Head") and player.Character.Head:FindFirstChild("PlayerESP")
            if billboardGui then
                local healthLabel = billboardGui:FindFirstChild("HealthLabel")
                if healthLabel then
                    healthLabel.Text = "Health: " .. player.Character.Humanoid.Health
                end
            end
        end
    end
end)
