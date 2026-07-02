-- === Mangekyo Sharingan Hub ===
print("🔴 Mangekyo Sharingan Hub - Załadowano!")

local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui")
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 380, 0, 300)
frame.Position = UDim2.new(0.5, -190, 0.5, -150)
frame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
frame.Parent = gui

Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 15)

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1,0,0,60)
title.Text = "Mangekyo Sharingan Hub"
title.TextColor3 = Color3.fromRGB(200, 0, 0)
title.BackgroundTransparency = 1
title.TextScaled = true
title.Font = Enum.Font.GothamBold
title.Parent = frame

-- Przycisk Auto Farm
local btn = Instance.new("TextButton")
btn.Size = UDim2.new(0.8,0,0,50)
btn.Position = UDim2.new(0.1,0,0.3,0)
btn.Text = "Auto Farm (ON/OFF)"
btn.BackgroundColor3 = Color3.fromRGB(0, 100, 0)
btn.TextColor3 = Color3.new(1,1,1)
btn.TextScaled = true
btn.Parent = frame

Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 10)

btn.MouseButton1Click:Connect(function()
    print("Auto Farm toggled!")
end)

print("Hub gotowy do rozbudowy!")
