-- === Mangekyo Sharingan Hub ===
print("🔴 Inicjalizacja Mangekyo Sharingan Hub...")

local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Intro
loadstring(game:HttpGet("https://raw.githubusercontent.com/mihalwoznicai-source/Mangekyo-Sharingan-Hub-roblox-blox-fruits/main/Intro.lua"))()

-- Po intro ładujemy główny hub
wait(4)
loadstring(game:HttpGet("https://raw.githubusercontent.com/mihalwoznicai-source/Mangekyo-Sharingan-Hub-roblox-blox-fruits/main/Hub.lua"))()
