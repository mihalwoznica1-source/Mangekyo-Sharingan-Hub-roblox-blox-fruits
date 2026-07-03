-- === Mangekyo Sharingan Hub - BLOX FRUITS EDITION (POPRAWIONY) ===
print("🔴 Mangekyo Sharingan Hub - Blox Fruits Edition!")

local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Zabezpieczenie przed duplikatami
if playerGui:FindFirstChild("MangekyoHub") then
    return
end

local gui = Instance.new("ScreenGui")
gui.Name = "MangekyoHub"
gui.ResetOnSpawn = false
gui.Parent = playerGui

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 380, 0, 400)
frame.Position = UDim2.new(0.5, -190, 0.5, -200)
frame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
frame.Parent = gui
Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 15)

-- Tytuł
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 60)
title.Text = "Mangekyo Sharingan Hub"
title.TextColor3 = Color3.fromRGB(200, 0, 0)
title.BackgroundTransparency = 1
title.TextScaled = true
title.Font = Enum.Font.GothamBold
title.Parent = frame

-- Przycisk zamykania
local closeBtn = Instance.new("TextButton")
closeBtn.Size = UDim2.new(0, 30, 0, 30)
closeBtn.Position = UDim2.new(1, -35, 0, 5)
closeBtn.Text = "X"
closeBtn.TextColor3 = Color3.new(1, 1, 1)
closeBtn.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
closeBtn.Parent = frame
Instance.new("UICorner", closeBtn).CornerRadius = UDim.new(0, 5)
closeBtn.MouseButton1Click:Connect(function()
    gui:Destroy()
end)

-- Przycisk Auto Level Farm
local btn = Instance.new("TextButton")
btn.Size = UDim2.new(0.8, 0, 0, 50)
btn.Position = UDim2.new(0.1, 0, 0.25, 0)
btn.Text = "Auto Level: OFF"
btn.BackgroundColor3 = Color3.fromRGB(0, 100, 0)
btn.TextColor3 = Color3.new(1, 1, 1)
btn.TextScaled = true
btn.Parent = frame
Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 10)

-- Przycisk Teleport
local teleportBtn = Instance.new("TextButton")
teleportBtn.Size = UDim2.new(0.8, 0, 0, 40)
teleportBtn.Position = UDim2.new(0.1, 0, 0.45, 0)
teleportBtn.Text = "Teleport do NPC"
teleportBtn.BackgroundColor3 = Color3.fromRGB(0, 50, 150)
teleportBtn.TextColor3 = Color3.new(1, 1, 1)
teleportBtn.TextScaled = true
teleportBtn.Parent = frame
Instance.new("UICorner", teleportBtn).CornerRadius = UDim.new(0, 10)

-- ===== LOGIKA AUTO LEVEL FARM DLA BLOX FRUITS =====
local autoFarmActive = false
local farmConnection = nil

-- Funkcja znajdująca najbliższego wroga
local function getNearestEnemy()
    local character = player.Character
    if not character then return nil end

    local rootPart = character:FindFirstChild("HumanoidRootPart")
    if not rootPart then return nil end

    local nearestEnemy = nil
    local shortestDistance = math.huge

    for _, enemy in ipairs(workspace:GetChildren()) do
        if enemy:IsA("Model") and enemy:FindFirstChild("Humanoid") then
            local isPlayer = false
            for _, p in ipairs(game.Players:GetPlayers()) do
                if enemy.Name == p.Name then
                    isPlayer = true
                    break
                end
            end

            if not isPlayer and enemy.Humanoid.Health > 0 then
                local enemyRoot = enemy:FindFirstChild("HumanoidRootPart")
                if enemyRoot then
                    local distance = (rootPart.Position - enemyRoot.Position).Magnitude
                    if distance < shortestDistance and distance < 3000 then
                        shortestDistance = distance
                        nearestEnemy = enemy
                    end
                end
            end
        end
    end

    return nearestEnemy
end

-- Funkcja do ataku
local function attackEnemy()
    local character = player.Character
    if not character then return end

    local enemy = getNearestEnemy()
    if not enemy then
        return
    end

    local enemyRoot = enemy:FindFirstChild("HumanoidRootPart")
    local humanoid = character:FindFirstChild("Humanoid")
    local rootPart = character:FindFirstChild("HumanoidRootPart")

    if enemyRoot and humanoid and rootPart then
        rootPart.CFrame = enemyRoot.CFrame * CFrame.new(0, 0, -3)
        task.wait(0.05)

        pcall(function()
            local attackRemote = game:GetService("ReplicatedStorage"):FindFirstChild("AttackEvent")
            if attackRemote then
                attackRemote:FireServer()
            else
                game:GetService("VirtualUser"):CaptureController()
                game:GetService("VirtualUser"):ClickButton2(Vector2.new())
            end
        end)
    end
end

-- Główna pętla farmienia
btn.MouseButton1Click:Connect(function()
    autoFarmActive = not autoFarmActive

    btn.Text = autoFarmActive and "Auto Level: ON" or "Auto Level: OFF"
    btn.BackgroundColor3 = autoFarmActive and Color3.fromRGB(200, 0, 0) or Color3.fromRGB(0, 100, 0)

    if autoFarmActive then
        print("✅ Auto Level FARM WŁĄCZONY!")

        farmConnection = game:GetService("RunService").Heartbeat:Connect(function()
            local character = player.Character
            local humanoid = character and character:FindFirstChild("Humanoid")

            if not character or not humanoid or humanoid.Health <= 0 then
                return
            end

            attackEnemy()
        end)

    else
        print("⛔ Auto Level FARM WYŁĄCZONY!")
        if farmConnection then
            farmConnection:Disconnect()
            farmConnection = nil
        end
    end
end)

-- Teleport do NPC
teleportBtn.MouseButton1Click:Connect(function()
    local enemy = getNearestEnemy()
    if enemy and enemy:FindFirstChild("HumanoidRootPart") then
        local character = player.Character
        if character and character:FindFirstChild("HumanoidRootPart") then
            character.HumanoidRootPart.CFrame = enemy.HumanoidRootPart.CFrame * CFrame.new(0, 0, -3)
            print("✅ Teleport do:", enemy.Name)
        end
    else
        print("⚠️ Nie znaleziono NPC w pobliżu!")
    end
end)

-- Wyświetlanie poziomu
local levelDisplay = Instance.new("TextLabel")
levelDisplay.Size = UDim2.new(0.8, 0, 0, 40)
levelDisplay.Position = UDim2.new(0.1, 0, 0.65, 0)
levelDisplay.Text = "Poziom: ?"
levelDisplay.TextColor3 = Color3.fromRGB(255, 255, 255)
levelDisplay.BackgroundTransparency = 1
levelDisplay.TextScaled = true
levelDisplay.Font = Enum.Font.Gotham
levelDisplay.Parent = frame

-- Aktualizacja poziomu
spawn(function()
    while frame and frame.Parent do
        local stats = player:FindFirstChild("leaderstats")
        if stats then
            local level = stats:FindFirstChild("Level")
            if level then
                levelDisplay.Text = "Poziom: " .. tostring(level.Value)
            else
                levelDisplay.Text = "Poziom: (nie znaleziono)"
            end
        else
            levelDisplay.Text = "Poziom: (brak danych)"
        end
        task.wait(1)
    end
end)

-- Stopka
local version = Instance.new("TextLabel")
version.Size = UDim2.new(1, 0, 0, 30)
version.Position = UDim2.new(0, 0, 1, -30)
version.Text = "v1.0 | Blox Fruits Auto Farm"
version.TextColor3 = Color3.fromRGB(100, 100, 100)
version.BackgroundTransparency = 1
version.TextScaled = true
version.Font = Enum.Font.Gotham
version.Parent = frame

print("✅ Mangekyo Hub (Blox Fruits) załadowany!")
