-- Grow a Garden 1 Place ID Verification Guard
local GrowAGarden_PlaceID = 126884695634066
if game.PlaceId ~= GrowAGarden_PlaceID then
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "NEXUS HUB v8.0",
        Text = "ERROR: This script is exclusive to Grow a Garden!",
        Duration = 5
    })
    return
end

if _G.TLoop then _G.TLoop = false task.wait(0.2) end
if game.CoreGui:FindFirstChild("DeltaVisualHubV8") then game.CoreGui.DeltaVisualHubV8:Destroy() end

local TS = game:GetService("TweenService")
local UIS = game:GetService("UserInputService")
local tInfo = TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out)

-- Internal Token Vault System
local currentBalance = 0 

local function fCom(n)
    local f = tostring(n):gsub(",", "")
    while true do 
        local k
        f, k = string.gsub(f, "^(-?%d+)(%d%d%d)", '%1,%2') 
        if k == 0 then break end 
    end
    return f
end

-- ScreenGui Setup
local SG = Instance.new("ScreenGui", game.CoreGui)
SG.Name = "DeltaVisualHubV8"
SG.ResetOnSpawn = false

-- Main Frame
local MF = Instance.new("Frame", SG)
MF.Size = UDim2.new(0, 360, 0, 290)
MF.Position = UDim2.new(0.5, -180, 0.4, -145)
MF.BackgroundColor3 = Color3.fromRGB(10, 6, 8)
MF.Active = true
MF.Draggable = true
Instance.new("UICorner", MF).CornerRadius = UDim.new(0, 14)

-- Dual-Color Glow Border
local ST = Instance.new("UIStroke", MF)
ST.Color = Color3.fromRGB(130, 10, 40)
ST.Thickness = 2
task.spawn(function()
    while task.wait(1) do
        if not MF or not MF.Parent then break end
        TS:Create(ST, TweenInfo.new(1), {Color = Color3.fromRGB(80, 15, 120)}):Play()
        task.wait(1)
        TS:Create(ST, TweenInfo.new(1), {Color = Color3.fromRGB(130, 10, 40)}):Play()
    end
end)

-- Header
local HB = Instance.new("Frame", MF)
HB.Size = UDim2.new(1, 0, 0, 56)
HB.BackgroundColor3 = Color3.fromRGB(18, 10, 14)
Instance.new("UICorner", HB).CornerRadius = UDim.new(0, 14)
local HBF = Instance.new("Frame", HB)
HBF.Size = UDim2.new(1, 0, 0, 10)
HBF.Position = UDim2.new(0, 0, 1, -10)
HBF.BackgroundColor3 = Color3.fromRGB(18, 10, 14)

-- Logo
local NL = Instance.new("TextLabel", HB)
NL.Size = UDim2.new(0, 36, 0, 36)
NL.Position = UDim2.new(0, 14, 0, 10)
NL.BackgroundColor3 = Color3.fromRGB(130, 10, 40)
NL.Text = "N"
NL.TextColor3 = Color3.fromRGB(255, 255, 255)
NL.TextSize = 18
NL.Font = Enum.Font.SourceSansBold
Instance.new("UICorner", NL).CornerRadius = UDim.new(0, 10)

-- Title
local TL = Instance.new("TextLabel", HB)
TL.Size = UDim2.new(0, 180, 0, 20)
TL.Position = UDim2.new(0, 58, 0, 11)
TL.BackgroundTransparency = 1
TL.Text = "NEXUS HUB v8.0"
TL.TextColor3 = Color3.fromRGB(240, 35, 75)
TL.TextSize = 14
TL.Font = Enum.Font.SourceSansBold
TL.TextXAlignment = Enum.TextXAlignment.Left

-- Credits
local CT = Instance.new("TextLabel", HB)
CT.Size = UDim2.new(0, 180, 0, 14)
CT.Position = UDim2.new(0, 58, 0, 29)
CT.BackgroundTransparency = 1
CT.Text = "by kingflame/nexus hub team"
CT.TextColor3 = Color3.fromRGB(140, 130, 135)
CT.TextSize = 9
CT.Font = Enum.Font.Code
CT.TextXAlignment = Enum.TextXAlignment.Left

-- Close & Minimize
local CloseC = Instance.new("TextButton", HB)
CloseC.Size = UDim2.new(0, 22, 0, 22)
CloseC.Position = UDim2.new(1, -34, 0, 17)
CloseC.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
CloseC.Text = "×"
CloseC.TextColor3 = Color3.fromRGB(25, 14, 16)
CloseC.TextSize = 16
CloseC.Font = Enum.Font.SourceSansBold
Instance.new("UICorner", CloseC).CornerRadius = UDim.new(0, 6)
Instance.new("UIStroke", CloseC).Color = Color3.fromRGB(60, 30, 35)

local MinC = Instance.new("TextButton", HB)
MinC.Size = UDim2.new(0, 22, 0, 22)
MinC.Position = UDim2.new(1, -62, 0, 17)
MinC.BackgroundColor3 = Color3.fromRGB(16, 14, 25)
MinC.Text = "-"
MinC.TextColor3 = Color3.fromRGB(200, 200, 200)
MinC.TextSize = 16
MinC.Font = Enum.Font.SourceSansBold
Instance.new("UICorner", MinC).CornerRadius = UDim.new(0, 6)
Instance.new("UIStroke", MinC).Color = Color3.fromRGB(35, 30, 60)

-- Minimized Icon
local NB = Instance.new("TextButton", SG)
NB.Size = UDim2.new(0, 48, 0, 48)
NB.Position = UDim2.new(0, 15, 0.5, -24)
NB.BackgroundColor3 = Color3.fromRGB(130, 10, 40)
NB.Text = "N"
NB.TextColor3 = Color3.fromRGB(255, 255, 255)
NB.TextSize = 22
NB.Font = Enum.Font.SourceSansBold
NB.Active = true
NB.Draggable = true
NB.Visible = false
Instance.new("UICorner", NB).CornerRadius = UDim.new(0, 12)
local NS = Instance.new("UIStroke", NB)
NS.Color = Color3.fromRGB(80, 15, 120)
NS.Thickness = 2

-- Section
local Sec1 = Instance.new("Frame", MF)
Sec1.Size = UDim2.new(1, -40, 0, 65)
Sec1.Position = UDim2.new(0, 20, 0, 70)
Sec1.BackgroundColor3 = Color3.fromRGB(16, 10, 12)
Instance.new("UICorner", Sec1).CornerRadius = UDim.new(0, 10)
Instance.new("UIStroke", Sec1).Color = Color3.fromRGB(35, 20, 24)

local L1 = Instance.new("TextLabel", Sec1)
L1.Size = UDim2.new(0, 160, 0, 20)
L1.Position = UDim2.new(0, 15, 0, 14)
L1.BackgroundTransparency = 1
L1.Text = "Token spawner"
L1.TextColor3 = Color3.fromRGB(235, 225, 230)
L1.TextSize = 13
L1.Font = Enum.Font.SourceSansBold
L1.TextXAlignment = Enum.TextXAlignment.Left

local L1Sub = Instance.new("TextLabel", Sec1)
L1Sub.Size = UDim2.new(0, 200, 0, 15)
L1Sub.Position = UDim2.new(0, 15, 0, 34)
L1Sub.BackgroundTransparency = 1
L1Sub.Text = "Stealth matrix purchase spoofer"
L1Sub.TextColor3 = Color3.fromRGB(140, 130, 135)
L1Sub.TextSize = 10
L1Sub.Font = Enum.Font.SourceSans
L1Sub.TextXAlignment = Enum.TextXAlignment.Left

local ToggleStatusText = Instance.new("TextLabel", Sec1)
ToggleStatusText.Size = UDim2.new(0, 30, 0, 15)
ToggleStatusText.Position = UDim2.new(1, -94, 0.5, -8)
ToggleStatusText.BackgroundTransparency = 1
ToggleStatusText.Text = "OFF"
ToggleStatusText.TextColor3 = Color3.fromRGB(150, 140, 145)
ToggleStatusText.TextSize = 10
ToggleStatusText.Font = Enum.Font.SourceSansBold
ToggleStatusText.TextXAlignment = Enum.TextXAlignment.Right

-- Toggle Switch
local ToggleBG = Instance.new("TextButton", Sec1)
ToggleBG.Size = UDim2.new(0, 46, 0, 22)
ToggleBG.Position = UDim2.new(1, -56, 0.5, -11)
ToggleBG.BackgroundColor3 = Color3.fromRGB(35, 25, 30)
ToggleBG.Text = ""
Instance.new("UICorner", ToggleBG).CornerRadius = UDim.new(1, 0)
Instance.new("UIStroke", ToggleBG).Color = Color3.fromRGB(65, 45, 52)

local ToggleCircle = Instance.new("Frame", ToggleBG)
ToggleCircle.Size = UDim2.new(0, 16, 0, 16)
ToggleCircle.Position = UDim2.new(0, 3, 0.5, -8)
ToggleCircle.BackgroundColor3 = Color3.fromRGB(240, 235, 240)
Instance.new("UICorner", ToggleCircle).CornerRadius = UDim.new(1, 0)

-- Input Box
local TX = Instance.new("TextBox", MF)
TX.Size = UDim2.new(1, -40, 0, 38)
TX.Position = UDim2.new(0, 20, 0, 150)
TX.BackgroundColor3 = Color3.fromRGB(12, 6, 8)
TX.Text = "0"
TX.PlaceholderText = "Enter amount..."
TX.PlaceholderColor3 = Color3.fromRGB(75, 55, 62)
TX.TextColor3 = Color3.fromRGB(255, 255, 255)
TX.TextSize = 14
TX.Font = Enum.Font.Code
Instance.new("UICorner", TX).CornerRadius = UDim.new(0, 8)
Instance.new("UIStroke", TX).Color = Color3.fromRGB(55, 24, 30)

TX:GetPropertyChangedSignal("Text"):Connect(function()
    local clean = TX.Text:gsub("%D", "")
    if TX.Text ~= clean then TX.Text = clean end
end)

-- Inject Button
local AB = Instance.new("TextButton", MF)
AB.Size = UDim2.new(1, -40, 0, 44)
AB.Position = UDim2.new(0, 20, 0, 202)
AB.BackgroundColor3 = Color3.fromRGB(32, 12, 16)
AB.Text = "⚡ FORCE INJECTION MATRIX ⚡"
AB.TextColor3 = Color3.fromRGB(170, 120, 130)
AB.TextSize = 11
AB.Font = Enum.Font.SourceSansBold
Instance.new("UICorner", AB).CornerRadius = UDim.new(0, 8)
Instance.new("UIStroke", AB).Color = Color3.fromRGB(90, 18, 26)

-- Console Log
local CL = Instance.new("TextLabel", MF)
CL.Size = UDim2.new(1, -40, 0, 24)
CL.Position = UDim2.new(0, 20, 0, 253)
CL.BackgroundTransparency = 1
CL.Text = ">> System status: Idle. Flip switch above."
CL.TextColor3 = Color3.fromRGB(130, 120, 125)
CL.TextSize = 10
CL.Font = Enum.Font.Code
CL.TextXAlignment = Enum.TextXAlignment.Left
CL.TextWrapped = true

-- Logic Vars
local isOn, cText, p = false, "0", game.Players.LocalPlayer
local targets = {}

-- Close/Minimize
CloseC.MouseButton1Click:Connect(function()
    _G.TLoop = false
    TS:Create(MF, tInfo, {Size = UDim2.new(0,0,0,0), Position = UDim2.new(0.5,0,0.4,0)}):Play()
    task.wait(0.25)
    SG:Destroy()
end)

MinC.MouseButton1Click:Connect(function()
    TS:Create(MF, tInfo, {Size = UDim2.new(0,0,0,0), Position = UDim2.new(0.5,0,0.4,0)}):Play()
    task.wait(0.15)
    MF.Visible = false
    NB.Visible = true
end)

NB.MouseButton1Click:Connect(function()
    NB.Visible = false
    MF.Visible = true
    TS:Create(MF, tInfo, {Size = UDim2.new(0,360,0,290), Position = UDim2.new(0.5,-180,0.4,-145)}):Play()
end)

-- Scanner Core
local function lockUI()
    targets = {}
    pcall(function()
        for _, u in pairs(p.PlayerGui:GetDescendants()) do
            if u:IsA("TextLabel") or u:IsA("TextBox") then
                if not u:IsDescendantOf(workspace) 
                and not u:FindFirstAncestorOfClass("BillboardGui") 
                and not u:FindFirstAncestorOfClass("SurfaceGui") then
                    local txt = u.Text
                    local lowTxt = txt:lower()
                    local pName = u.Parent and u.Parent.Name:lower() or ""
                    local gpName = u.Parent and u.Parent.Parent and u.Parent.Parent.Name:lower() or ""

                    if not string.find(lowTxt, "boost") 
                    and not string.find(lowTxt, "multiplier") 
                    and not string.find(lowTxt, "level") 
                    and not string.find(lowTxt, "rebirth") then
                        if not string.find(pName, "card") 
                        and not string.find(pName, "template") 
                        and not string.find(pName, "price") 
                        and not string.find(pName, "btn") 
                        and not string.find(pName, "button") then
                            if not string.find(gpName, "card") 
                            and not string.find(gpName, "template") 
                            and not string.find(gpName, "list") then
                                if string.find(lowTxt, "tokens:") 
                                or string.find(lowTxt, "token:") 
                                or pName == "tokens" 
                                or pName == "token" then
                                    table.insert(targets, u)
                                elseif string.find(txt, "^[%d,]+$") 
                                and (string.find(pName, "currency") 
                                    or string.find(pName, "main") 
                                    or string.find(pName, "top") 
                                    or string.find(pName, "bar") 
                                    or string.find(pName, "trade") 
                                    or string.find(gpName, "trade")) then
                                    table.insert(targets, u)
                                end
                            end
                        end
                    end
                end
            end
        end
    end)
end

-- Toggle Animation
ToggleBG.MouseButton1Click:Connect(function()
    isOn = not isOn
    if isOn then
        TS:Create(ToggleCircle, tInfo, {Position = UDim2.new(1, -19, 0.5, -8), BackgroundColor3 = Color3.fromRGB(255,255,255)}):Play()
        TS:Create(ToggleBG, tInfo, {BackgroundColor3 = Color3.fromRGB(130,10,40)}):Play()
        TS:Create(ToggleStroke, tInfo, {Color = Color3.fromRGB(200,20,60)}):Play()
        TS:Create(AB, tInfo, {BackgroundColor3 = Color3.fromRGB(130,10,40)}):Play()
        AB.TextColor3 = Color3.fromRGB(255,255,255)
        ToggleStatusText.Text = "ON"
        ToggleStatusText.TextColor3 = Color3.fromRGB(240,35,75)
        CL.Text = ">> Stealth bypass engine online. Hooks fully engaged."
        lockUI()
    else
        TS:Create(ToggleCircle, tInfo, {Position = UDim2.new(0,3,0.5,-8), BackgroundColor3 = Color3.fromRGB(200,195,200)}):Play()
        TS:Create(ToggleBG, tInfo, {BackgroundColor3 = Color3.fromRGB(35,25,30)}):Play()
        TS:Create(ToggleStroke, tInfo, {Color = Color3.fromRGB(65,45,52)}):Play()
        TS:Create(AB, tInfo, {BackgroundColor3 = Color3.fromRGB(32,12,16)}):Play()
        AB.TextColor3 = Color3.fromRGB(170,120,130)
        ToggleStatusText.Text = "OFF"
        ToggleStatusText.TextColor3 = Color3.fromRGB(150,140,145)
        CL.Text = ">> Stealth engine paused. Normal state active."
    end
end)

-- Inject Logic
AB.MouseButton1Click:Connect(function()
    if not isOn then
        CL.Text = ">> ERROR: Turn ON the Stealth Switch above first!"
        return
    end
    lockUI()
    cText = TX.Text:gsub("%%D", "")
    if cText == "" then cText = "0" end
    currentBalance = tonumber(cText) or 0
    local cc = fCom(cText)
    
    for _, u in pairs(targets) do
        pcall(function()
            if string.find(u.Text:lower(), "tokens:") then
                u.Text = "Tokens: " .. cc
            elseif string.find(u.Text:lower(), "token:") then
                u.Text = "Token: " .. cc
            else
                u.Text = cc
            end
        end)
    end
    CL.Text = ">> SUCCESS: Visual matrix injected: [" .. cc .. "]"
end)

-- Dynamic Sync Loop
_G.TLoop = true
task.spawn(function()
    while _G.TLoop do
        task.wait(0.05)
        if isOn and cText ~= "" then
            local cc = fCom(currentBalance)
            for _, u in pairs(targets) do
                pcall(function()
                    local low = u.Text:lower()
                    if string.find(low, "tokens:") and u.Text ~= "Tokens: "..cc then
                        u.Text = "Tokens: "..cc
                    elseif string.find(low, "token:") and u.Text ~= "Token: "..cc then
                        u.Text = "Token: "..cc
                    elseif u.Text ~= cc and not string.find(low, "token") then
                        u.Text = cc
                    end
                end)
            end
        end
    end
end)

-- Purchase / Booth Auto-Buy
UIS.InputBegan:Connect(function(input, proc)
    if not isOn or proc then return end
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        pcall(function()
            local char = p.Character
            if not char then return end
            local root = char:FindFirstChild("HumanoidRootPart")
            if not root then return end
            
            local closestBooth, maxDist = nil, 15
            for _, v in pairs(workspace:GetDescendants()) do
                if v.Name == "Booth" or string.find(v.Name:lower(), "booth") then
                    local part = v:IsA("BasePart") and v or v:FindFirstChildWhichIsA("BasePart", true)
                    if part then
                        local dist = (root.Position - part.Position).Magnitude
                        if dist < maxDist then
                            closestBooth = v
                            maxDist = dist
                        end
                    end
                end
            end
            
            if closestBooth then
                local petPrice = 0
                for _, lbl in pairs(closestBooth:GetDescendants()) do
                    if lbl:IsA("TextLabel") and string.find(lbl.Text, "^[%d,]+$") then
                        local val = tonumber(lbl.Text:gsub(",", ""))
                        if val and val > petPrice then petPrice = val end
                    end
                end
                
                if petPrice > 0 and currentBalance >= petPrice then
                    task.wait(0.1)
                    currentBalance = currentBalance - petPrice
                    TX.Text = tostring(currentBalance)
                    CL.Text = ">> Vault balance updated: Deducted -" .. fCom(petPrice) .. " Tokens."
                end
            end
        end)
    end
end)

-- Cleanup Notifications
task.spawn(function()
    while task.wait(0.02) do
        if not isOn then continue end
        pcall(function()
            for _, u in pairs(p.PlayerGui:GetDescendants()) do
                if u:IsA("TextLabel") then
                    local lt = u.Text:lower()
                    if string.find(lt, "don't have enough tokens") or string.find(lt, "enough tokens to buy") then
                        u.Visible = false
                        u:Destroy()
                    end
                end
            end
        end)
    end
end)
