-- Holt die echte Minen-Tabelle aus dem Speicher
local minesData = nil

for _, obj in pairs(getgc(true)) do
if type(obj) == "table" then
local valid = true
local count = 0
for _, v in pairs(obj) do
if type(v) ~= "number" then
valid = false
break
end
count += 1
end
if valid and count == 25 then
minesData = obj
break
end
end
end

if not minesData then
warn("❌ Minen-Daten nicht gefunden.")
return
end

-- Holt das GUI-Wurzelobjekt
local tilesFolder = game.Players.LocalPlayer.PlayerGui
:WaitForChild("UI")
:WaitForChild("Main")
:WaitForChild("Games")
:WaitForChild("Mines")
:WaitForChild("Screen")
:WaitForChild("Tiles")

-- Markiert jeden Clicker-Button visuell
for i = 1, 25 do
local tile = tilesFolder:FindFirstChild(tostring(i))
if tile and tile:FindFirstChild("Clicker") then
local button = tile.Clicker
local bgColor = (minesData[i] == 1) and Color3.fromRGB(255, 0, 0) or Color3.fromRGB(0, 255, 0)

-- Hintergrundfarbe setzen  
    button.BackgroundColor3 = bgColor  
    button.BackgroundTransparency = 0.3  
else  
    warn("❓ Tile fehlt:", i)  
end

end

print("✅ Alle Minenfelder im GUI markiert.")
