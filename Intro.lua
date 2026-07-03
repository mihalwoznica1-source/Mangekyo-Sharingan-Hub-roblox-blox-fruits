-- Intro - Mangekyo Sharingan Hub
local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- ⚠️ ZABEZPIECZENIE 1: Zapobiega nakładaniu się intro
if playerGui:FindFirstChild("MangekyoIntro") then
    return
end

local gui = Instance.new("ScreenGui")
gui.Name = "MangekyoIntro"
gui.ResetOnSpawn = false
gui.Parent = playerGui

-- Czarne tło
local black = Instance.new("Frame")
black.Size = UDim2.new(1, 0, 1, 0)
black.BackgroundColor3 = Color3.new(0, 0, 0)
black.BackgroundTransparency = 1
black.Parent = gui

black.BackgroundTransparency = 0
task.wait(0.3)  -- ⚠️ ZMIENIONE: wait() → task.wait()

-- Czerwony napis
local title = Instance.new("TextLabel")
title.Size = UDim2.new(0, 700, 0, 80)
title.Position = UDim2.new(0, -800, 0.8, 0)
title.BackgroundTransparency = 1
title.Text = "Mangekyo Sharingan Hub"
title.TextColor3 = Color3.fromRGB(200, 0, 0)
title.TextScaled = true
title.Font = Enum.Font.GothamBold
title.TextStrokeTransparency = 0.4
title.TextStrokeColor3 = Color3.fromRGB(60, 0, 0)
title.Parent = gui

title:TweenPosition(UDim2.new(0.5, -350, 0.8, 0), "Out", "Quint", 2.2, true)

-- Sharingan
local sharingan = Instance.new("ImageLabel")
sharingan.Size = UDim2.new(0, 340, 0, 340)
sharingan.Position = UDim2.new(0.5, -170, 0.4, 0)
sharingan.BackgroundTransparency = 1
sharingan.Image = "rbxassetid://6031097223"
sharingan.Parent = gui

-- ⚠️ ZMIENIONE: Bezpieczniejsze kręcenie z task.wait()
spawn(function()
    while sharingan and sharingan.Parent do
        sharingan.Rotation = (sharingan.Rotation + 3.5) % 360
        task.wait(0.016)  -- wait() → task.wait()
    end
end)

-- ⚠️ ZABEZPIECZENIE 2: Dźwięk z obsługą błędów
local sound = Instance.new("Sound")
sound.SoundId = "rbxassetid://121443615453073"
sound.Volume = 0.75
sound.Parent = gui

local success, err = pcall(function()
    sound:Play()
end)
if not success then
    warn("❌ Nie można odtworzyć dźwięku:", err)
end

task.wait(4.8)  -- ⚠️ ZMIENIONE: wait() → task.wait()

-- Fade out
for i = 0, 1, 0.05 do
    black.BackgroundTransparency = i
    sharingan.ImageTransparency = i
    title.TextTransparency = i
    task.wait(0.05)  -- ⚠️ ZMIENIONE: wait() → task.wait()
end

gui:Destroy()
