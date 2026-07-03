-- main.lua z obsługą błędów i poprawnym linkiem
local function loadScript(url)
    local success, err = pcall(function()
        loadstring(game:HttpGet(url))()
    end)
    if not success then
        warn("❌ Błąd ładowania:", url, err)
    end
    return success
end

-- Załaduj intro z zabezpieczeniem
loadScript("https://raw.githubusercontent.com/mihalwoznica1-source/Mangekyo-Sharingan-Hub-roblox-blox-fruits/main/Intro.lua")

wait(5)

-- Załaduj hub
loadScript("https://raw.githubusercontent.com/mihalwoznica1-source/Mangekyo-Sharingan-Hub-roblox-blox-fruits/main/Hub.lua")

print("✅ Hub gotowy do rozbudowy!")
