-- === Mangekyo Sharingan Hub - Main ===
print("🔴 Uruchamiam Mangekyo Sharingan Hub...")

local repo = "https://raw.githubusercontent.com/mihalwoznicai-source/Mangekyo-Sharingan-Hub-roblox-blox-fruits/main/"

-- Najpierw Intro
loadstring(game:HttpGet(repo .. "Intro.lua"))()

wait(5)  -- czekamy aż intro się skończy

-- Potem Hub
loadstring(game:HttpGet(repo .. "Hub.lua"))()

print("Hub powinien się pojawić!")
