-- Intro - Mangekyo Sharingan Hub
local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui")
gui.Name = "MangekyoIntro"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

-- Czarne tło
local black = Instance.new("Frame")
black.Size = UDim2.new(1, 0, 1, 0)
black.BackgroundColor3 = Color3.new(0, 0, 0)
black.BackgroundTransparency = 1
black.Parent = gui

black.BackgroundTransparency = 0
wait(0.3)

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

-- Sharingan (tymczasowy placeholder - możesz później zmienić)
local sharingan = Instance.new("ImageLabel")
sharingan.Size = UDim2.new(0, 340, 0, 340)
sharingan.Position = UDim2.new(0.5, -170, 0.4, 0)
sharingan.BackgroundTransparency = 1
sharingan.Image = "rbxassetid://6031097223"  -- publiczny Sharingan
sharingan.Parent = gui

-- Kręcenie
spawn(function()
    while sharingan and sharingan.Parent do
        sharingan.Rotation = sharingan.Rotation + 3.5
        wait(0.016)
    end
end)

-- Twój dźwięk
local sound = Instance.new("Sound")
sound.SoundId = "rbxassetid://121443615453073"
sound.Volume = 0.75
sound.Parent = gui
sound:Play()

wait(4.8)

-- Fade out
for i = 0, 1, 0.05 do
    black.BackgroundTransparency = i
    sharingan.ImageTransparency = i
    title.TextTransparency = i
    wait(0.05)
end

gui:Destroy()
