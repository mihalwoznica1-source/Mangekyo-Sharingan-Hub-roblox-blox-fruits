-- Intro - Mangekyo Sharingan Hub (Poprawione)
local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Zabezpieczenie przed duplikatami
if playerGui:FindFirstChild("MangekyoIntro") then
    return
end

local gui = Instance.new("ScreenGui")
gui.Name = "MangekyoIntro"
gui.ResetOnSpawn = false
gui.Parent = playerGui
gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

-- === PRAWIDŁOWE PEŁNOEKANOWE TŁO ===
local black = Instance.new("Frame")
black.Size = UDim2.new(1, 0, 1, 0)
black.Position = UDim2.new(0, 0, 0, 0)
black.BackgroundColor3 = Color3.new(0, 0, 0)
black.BackgroundTransparency = 1
black.BorderSizePixel = 0
black.ZIndex = 10  -- WAŻNE: tło jest na wierzchu
black.Parent = gui

-- Płynne pojawianie się tła
black.BackgroundTransparency = 0
task.wait(0.3)

-- === NAPIS ===
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
title.ZIndex = 11  -- Nad tłem
title.Parent = gui

-- Animacja wjazdu napisu
title:TweenPosition(UDim2.new(0.5, -350, 0.8, 0), "Out", "Quint", 2.2, true)

-- === OBRAZEK SHARINGANA ===
local sharingan = Instance.new("ImageLabel")
sharingan.Size = UDim2.new(0, 340, 0, 340)
sharingan.Position = UDim2.new(0.5, -170, 0.4, 0)
sharingan.BackgroundTransparency = 1
sharingan.Image = "rbxassetid://6031097223"  -- Publiczny Sharingan
sharingan.ZIndex = 11  -- Nad tłem
sharingan.Parent = gui

-- Kręcenie Sharinganem (bezpieczna pętla)
spawn(function()
    while sharingan and sharingan.Parent do
        sharingan.Rotation = (sharingan.Rotation + 3.5) % 360
        task.wait(0.016)
    end
end)

-- === DŹWIĘK (z zabezpieczeniem) ===
local sound = Instance.new("Sound")
sound.SoundId = "rbxassetid://121443615453073"
sound.Volume = 0.75
sound.Parent = gui

-- Próba odtworzenia dźwięku z obsługą błędów
local soundSuccess, soundErr = pcall(function()
    sound:Play()
end)

if not soundSuccess then
    warn("❌ Nie można odtworzyć dźwięku (ID może być nieprawidłowe):", soundErr)
    -- Ustawiamy alternatywny dźwięk (cisza)
    sound.SoundId = "rbxassetid://0"
    sound:Play()
end

-- Czas na wyświetlenie intro (z dźwiękiem lub bez)
task.wait(4.8)

-- === FADE OUT (płynne znikanie) ===
for i = 0, 1, 0.05 do
    black.BackgroundTransparency = i
    sharingan.ImageTransparency = i
    title.TextTransparency = i
    task.wait(0.05)
end

-- Usunięcie intro
gui:Destroy()
