if _G.TLoop then _G.TLoop = false task.wait(0.2) end
if game.CoreGui:FindFirstChild("DeltaVisualHubV7") then game.CoreGui.DeltaVisualHubV7:Destroy() end

local TS = game:GetService("TweenService")
local tInfo = TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out)
local tInfo2 = TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out)

-- Internal Token Vault System (Naka-set na sa 0 sa umpisa ng execution)
local currentBalance = 0 

local function fCom(n)
    local f = tostring(n):gsub(",", "")
    while true do 
        local k
        f, k = string.gsub(f, "^(-?%d+)(%d%d%d)", '%1,%2') 
        if (k == 0) then break end 
    end
    return f
end

-- ScreenGui Setup
local SG = Instance.new("ScreenGui", game.CoreGui) SG.Name = "DeltaVisualHubV7" SG.ResetOnSpawn = false

-- Main Frame (Red-Purple Compact Layout)
local MF = Instance.new("Frame", SG) MF.Size = UDim2.new(0, 360, 0, 290) MF.Position = UDim2.new(0.5, -180, 0.4, -145) MF.BackgroundColor3 = Color3.fromRGB(10, 6, 8) MF.Active = true MF.Draggable = true
Instance.new("UICorner", MF).CornerRadius = UDim.new(0, 14)

-- Premium Dual-Color Border Glow Effect
local ST = Instance.new("UIStroke", MF) ST.Color = Color3.fromRGB(130, 10, 40) ST.Thickness = 2
task.spawn(function()
    while task.wait(1) do
        if MF and MF.Parent then
            TS:Create(ST, TweenInfo.new(1), {Color = Color3.fromRGB(80, 15, 120)}):Play()
            task.wait(1)
            TS:Create(ST, TweenInfo.new(1), {Color = Color3.fromRGB(130, 10, 40)}):Play()
        end
    end
end)

-- Header Background
local HB = Instance.new("Frame", MF) HB.Size = UDim2.new(1, 0, 0, 56) HB.BackgroundColor3 = Color3.fromRGB(18, 10, 14)
local HBC = Instance.new("UICorner", HB) HBC.CornerRadius = UDim.new(0, 14)
local HBF = Instance.new("Frame", HB) HBF.Size = UDim2.new(1, 0, 0, 12) HBF.Position = UDim2.new(0, 0, 1, -12) HBF.BorderSizePixel = 0 HBF.BackgroundColor3 = Color3.fromRGB(18, 10, 14)

-- Compact Round N Logo (Left Side)
local NL = Instance.new("TextLabel", HB) NL.Size = UDim2.new(0, 36, 0, 36) NL.Position = UDim2.new(0, 14, 0, 10) NL.BackgroundColor3 = Color3.fromRGB(130, 10, 40) NL.Text = "N" NL.TextColor3 = Color3.fromRGB(255, 255, 255) NL.TextSize = 18 NL.Font = Enum.Font.SourceSansBold
Instance.new("UICorner", NL).CornerRadius = UDim.new(0, 10)

-- Title text (Nexus Hub Mode)
local TL = Instance.new("TextLabel", HB) TL.Size = UDim2.new(0, 180, 0, 20) TL.Position = UDim2.new(0, 58, 0, 11) TL.BackgroundTransparency = 1 TL.Text = "Nexus Hub Token Spawner" TL.TextColor3 = Color3.fromRGB(240, 35, 75) TL.TextSize = 13 TL.Font = Enum.Font.SourceSansBold TL.TextXAlignment = Enum.TextXAlignment.Left

-- Credits text
local CT = Instance.new("TextLabel", HB) CT.Size = UDim2.new(0, 180, 0, 14) CT.Position = UDim2.new(0, 58, 0, 29) CT.BackgroundTransparency = 1 CT.Text = "by kingflame/nexus hub team" CT.TextColor3 = Color3.fromRGB(140, 130, 135) CT.TextSize = 9 CT.Font = Enum.Font.Code CT.TextXAlignment = Enum.TextXAlignment.Left

-- Compact Control Container (For - and X Buttons)
local CloseC = Instance.new("TextButton", HB) CloseC.Size = UDim2.new(0, 22, 0, 22) CloseC.Position = UDim2.new(1, -34, 0, 17) CloseC.BackgroundColor3 = Color3.fromRGB(25, 14, 16) CloseC.Text = "×" CloseC.TextColor3 = Color3.fromRGB(255, 255, 255) CloseC.TextSize = 16 CloseC.Font = Enum.Font.SourceSansBold
Instance.new("UICorner", CloseC).CornerRadius = UDim.new(0, 6)
local CloseStroke = Instance.new("UIStroke", CloseC) CloseStroke.Color = Color3.fromRGB(60, 30, 35)

local MinC = Instance.new("TextButton", HB) MinC.Size = UDim2.new(0, 22, 0, 22) MinC.Position = UDim2.new(1, -62, 0, 17) MinC.BackgroundColor3 = Color3.fromRGB(16, 14, 25) MinC.Text = "-" MinC.TextColor3 = Color3.fromRGB(200, 200, 200) MinC.TextSize = 16 MinC.Font = Enum.Font.SourceSansBold
Instance.new("UICorner", MinC).CornerRadius = UDim.new(0, 6)
local MinStroke = Instance.new("UIStroke", MinC) MinStroke.Color = Color3.fromRGB(35, 30, 60)

-- Floating Mini Rounded Icon
local NB = Instance.new("TextButton", SG) NB.Size = UDim2.new(0, 48, 0, 48) NB.Position = UDim2.new(0, 15, 0.5, -24) NB.BackgroundColor3 = Color3.fromRGB(130, 10, 40) NB.Text = "N" NB.TextColor3 = Color3.fromRGB(255, 255, 255) NB.TextSize = 22 NB.Font = Enum.Font.SourceSansBold NB.Active = true NB.Draggable = true NB.Visible = false
Instance.new("UICorner", NB).CornerRadius = UDim.new(0, 12)
local NS = Instance.new("UIStroke", NB) NS.Color = Color3.fromRGB(80, 15, 120) NS.Thickness = 2

-- Section Container
local Sec1 = Instance.new("Frame", MF) Sec1.Size = UDim2.new(1, -40, 0, 65) Sec1.Position = UDim2.new(0, 20, 0, 70) Sec1.BackgroundColor3 = Color3.fromRGB(16, 10, 12)
Instance.new("UICorner", Sec1).CornerRadius = UDim.new(0, 10)
local Sec1S = Instance.new("UIStroke", Sec1) Sec1S.Color = Color3.fromRGB(35, 20, 24)

local L1 = Instance.new("TextLabel", Sec1) L1.Size = UDim2.new(0, 160, 0, 20) L1.Position = UDim2.new(0, 15, 0, 14) L1.BackgroundTransparency = 1 L1.Text = "Anti-Detection Engine" L1.TextColor3 = Color3.fromRGB(235, 225, 230) L1.TextSize = 13 L1.Font = Enum.Font.SourceSansBold L1.TextXAlignment = Enum.TextXAlignment.Left

local L1Sub = Instance.new("TextLabel", Sec1) L1Sub.Size = UDim2.new(0, 200, 0, 15) L1Sub.Position = UDim2.new(0, 15, 0, 34) L1Sub.BackgroundTransparency = 1 L1Sub.Text = "Stealth matrix purchase spoofer" L1Sub.TextColor3 = Color3.fromRGB(140, 130, 135) L1Sub.TextSize = 10 L1Sub.Font = Enum.Font.SourceSans L1Sub.TextXAlignment = Enum.TextXAlignment.Left

-- Compact Toggle Text Indicators
local ToggleStatusText = Instance.new("TextLabel", Sec1) ToggleStatusText.Size = UDim2.new(0, 30, 0, 15) ToggleStatusText.Position = UDim2.new(1, -94, 0.5, -8) ToggleStatusText.BackgroundTransparency = 1 ToggleStatusText.Text = "OFF" ToggleStatusText.TextColor3 = Color3.fromRGB(150, 140, 145) ToggleStatusText.TextSize = 10 ToggleStatusText.Font = Enum.Font.SourceSansBold ToggleStatusText.TextXAlignment = Enum.TextXAlignment.Right

-- Smooth Switch Toggle
local ToggleBG = Instance.new("TextButton", Sec1) ToggleBG.Size = UDim2.new(0, 46, 0, 22) ToggleBG.Position = UDim2.new(1, -56, 0.5, -11) ToggleBG.BackgroundColor3 = Color3.fromRGB(35, 25, 30) ToggleBG.Text = ""
Instance.new("UICorner", ToggleBG).CornerRadius = UDim.new(1, 0)
local ToggleStroke = Instance.new("UIStroke", ToggleBG) ToggleStroke.Color = Color3.fromRGB(65, 45, 52) ToggleStroke.Thickness = 1

local ToggleCircle = Instance.new("Frame", ToggleBG) ToggleCircle.Size = UDim2.new(0, 16, 0, 16) ToggleCircle.Position = UDim2.new(0, 3, 0.5, -8) ToggleCircle.BackgroundColor3 = Color3.fromRGB(240, 235, 240)
Instance.new("UICorner", ToggleCircle).CornerRadius = UDim.new(1, 0)

-- Text Box (Naka-set sa 0 ang default text at may dynamic placeholder indicator)
local TX = Instance.new("TextBox", MF) TX.Size = UDim2.new(1, -40, 0, 38) TX.Position = UDim2.new(0, 20, 0, 150) TX.BackgroundColor3 = Color3.fromRGB(12, 6, 8) TX.Text = "0" TX.PlaceholderText = "Enter amount..." TX.PlaceholderColor3 = Color3.fromRGB(75, 55, 62) TX.TextColor3 = Color3.fromRGB(255, 255, 255) TX.TextSize = 14 TX.Font = Enum.Font.Code
Instance.new("UICorner", TX).CornerRadius = UDim.new(0, 8)
local TXS = Instance.new("UIStroke", TX) TXS.Color = Color3.fromRGB(55, 24, 30) TXS.Thickness = 1

-- Number-Only Guard
TX:GetPropertyChangedSignal("Text"):Connect(function()
    local clean = TX.Text:gsub("%D", "")
    if TX.Text ~= clean then TX.Text = clean end
end)

-- Apply Button (⚡ INJECT ⚡)
local AB = Instance.new("TextButton", MF) AB.Size = UDim2.new(1, -40, 0, 44) AB.Position = UDim2.new(0, 20, 0, 202) AB.BackgroundColor3 = Color3.fromRGB(32, 12, 16) AB.Text = "⚡ FORCE INJECTION MATRIX ⚡" AB.TextColor3 = Color3.fromRGB(170, 120, 130) AB.TextSize = 11 AB.Font = Enum.Font.SourceSansBold
Instance.new("UICorner", AB).CornerRadius = UDim.new(0, 8)
local ABS = Instance.new("UIStroke", AB) ABS.Color = Color3.fromRGB(90, 18, 26) ABS.Thickness = 1.5

-- Status Console Log Panel
local CL = Instance.new("TextLabel", MF) CL.Size = UDim2.new(1, -40, 0, 24) CL.Position = UDim2.new(0, 20, 0, 253) CL.BackgroundTransparency = 1 CL.Text = ">> System status: Idle. Flip switch above." CL.TextColor3 = Color3.fromRGB(130, 120, 125) CL.TextSize = 10 CL.Font = Enum.Font.Code CL.TextXAlignment = Enum.TextXAlignment.Left CL.TextWrapped = true

-- Logic Variables
local isOn, cText, p = false, "0", game.Players.LocalPlayer
local targets = {}

-- Window Compact Click Mechanics
CloseC.MouseButton1Click:Connect(function() 
    _G.TLoop = false 
    TS:Create(MF, tInfo, {Size = UDim2.new(0, 0, 0, 0), Position = UDim2.new(0.5, 0, 0.4, 0)}):Play() 
    task.wait(0.25) SG:Destroy() 
end)

MinC.MouseButton1Click:Connect(function() 
    TS:Create(MF, tInfo, {Size = UDim2.new(0, 0, 0, 0), Position = UDim2.new(0.5, 0, 0.4, 0)}):Play() 
    task.wait(0.15) MF.Visible = false NB.Visible = true 
end)

NB.MouseButton1Click:Connect(function() 
    NB.Visible = false MF.Visible = true 
    TS:Create(MF, tInfo, {Size = UDim2.new(0, 360, 0, 290), Position = UDim2.new(0.5, -180, 0.4, -145)}):Play() 
end)

-- Anti-Bug Super Precise Scanner Core
local function lockUI()
    targets = {}
    pcall(function()
        for _, u in pairs(p.PlayerGui:GetDescendants()) do
            if u:IsA("TextLabel") or u:IsA("TextBox") then
                if not u:IsDescendantOf(workspace) and not u:FindFirstAncestorOfClass("BillboardGui") and not u:FindFirstAncestorOfClass("SurfaceGui") then
                    local txt = u.Text
                    local lowTxt = txt:lower()
                    local pName = u.Parent and u.Parent.Name:lower() or ""
                    local gpName = u.Parent and u.Parent.Parent and u.Parent.Parent.Name:lower() or ""
                    
                    if not string.find(lowTxt, "boost") and not string.find(lowTxt, "multiplier") and not string.find(lowTxt, "level") and not string.find(lowTxt, "rebirth") then
                        if not string.find(pName, "card") and not string.find(pName, "template") and not string.find(pName, "price") and not string.find(pName, "btn") and not string.find(pName, "button") then
                            if not string.find(gpName, "card") and not string.find(gpName, "template") and not string.find(gpName, "list") then
                                if string.find(lowTxt, "tokens:") or string.find(lowTxt, "token:") or pName == "tokens" or pName == "token" then
                                    table.insert(targets, u)
                                elseif string.find(txt, "^[%d,]+$") and (string.find(pName, "currency") or string.find(pName, "main") or string.find(pName, "top") or string.find(pName, "bar") or string.find(pName, "trade") or string.find(gpName, "trade")) then
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

-- Market Error Notification Muter at Auto-Deductor
local function startErrorNotificationListener()
    pcall(function()
        local function checkAndMute(child)
            if isOn and child:IsA("TextLabel") then
                local lowText = child.Text:lower()
                if string.find(lowText, "don't have enough tokens") or string.find(lowText, "enough tokens to buy") then
                    child.Visible = false
                    task.defer(function() child:Destroy() end)
                end
            end
        end
        p.PlayerGui.DescendantAdded:Connect(checkAndMute)
    end)
    
    pcall(function()
        local function scanAndDeduct()
            local petPrice = 0
            local character = p.Character
            if character and character:FindFirstChild("HumanoidRootPart") then
                local root = character.HumanoidRootPart
                local closestBooth = nil
                local maxDist = 20
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
                    for _, lbl in pairs(closestBooth:GetDescendants()) do
                        if lbl:IsA("TextLabel") and string.find(lbl.Text, "^[%d,]+$") then
                            local val = tonumber(lbl.Text:gsub(",", ""))
                            if val and val > petPrice then petPrice = val end
                        end
                    end
                end
            end
            if petPrice == 0 then petPrice = 25000 end
            if currentBalance >= petPrice then
                currentBalance = currentBalance - petPrice
                TX.Text = tostring(currentBalance)
                cText = tostring(currentBalance)
                CL.Text = ">> Vault balance update: Deducted -" .. fCom(petPrice) .. " Tokens."
            end
        end
        task.spawn(function()
            while task.wait(1) do
                if isOn then scanAndDeduct() end
            end
        end)
    end)
end

-- Toggle Switch Logic
ToggleBG.MouseButton1Click:Connect(function()
    isOn = not isOn
    if isOn then
        TS:Create(ToggleCircle, tInfo2, {Position = UDim2.new(1, -19, 0.5, -8), BackgroundColor3 = Color3.fromRGB(255, 255, 255)}):Play()
        TS:Create(ToggleBG, tInfo2, {BackgroundColor3 = Color3.fromRGB(130, 10, 40)}):Play()
        TS:Create(ToggleStroke, tInfo2, {Color = Color3.fromRGB(200, 20, 60)}):Play()
        TS:Create(AB, tInfo2, {BackgroundColor3 = Color3.fromRGB(130, 10, 40)}):Play()
        AB.TextColor3 = Color3.fromRGB(255, 255, 255)
        ToggleStatusText.Text = "ON"
        ToggleStatusText.TextColor3 = Color3.fromRGB(240, 35, 75)
        CL.Text = ">> Stealth bypass engine online. Hooks fully engaged."
        lockUI()
        startErrorNotificationListener()
    else
        TS:Create(ToggleCircle, tInfo2, {Position = UDim2.new(0, 3, 0.5, -8), BackgroundColor3 = Color3.fromRGB(200, 195, 200)}):Play()
        TS:Create(ToggleBG, tInfo2, {BackgroundColor3 = Color3.fromRGB(35, 25, 30)}):Play()
        TS:Create(ToggleStroke, tInfo2, {Color = Color3.fromRGB(65, 45, 52)}):Play()
        TS:Create(AB, tInfo2, {BackgroundColor3 = Color3.fromRGB(32, 12, 16)}):Play()
        AB.TextColor3 = Color3.fromRGB(170, 120, 130)
        ToggleStatusText.Text = "OFF"
        ToggleStatusText.TextColor3 = Color3.fromRGB(150, 140, 145)
        CL.Text = ">> Stealth engine paused. Normal state active."
    end
end)

-- Inject Button Logic
AB.MouseButton1Click:Connect(function()
    if not isOn then
        CL.Text = ">> ERROR: Turn ON the Stealth Switch above first!"
        return
    end
    lockUI()
    cText = TX.Text:gsub("%D", "")
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

-- Dynamic Loop Sync Block
_G.TLoop = true
task.spawn(function()
    while _G.TLoop do
        if isOn and cText ~= "" then
            local cc = fCom(currentBalance)
            for _, u in pairs(targets) do
                pcall(function()
                    if string.find(u.Text:lower(), "tokens:") and u.Text ~= "Tokens: " .. cc then
                        u.Text = "Tokens: " .. cc
                    elseif string.find(u.Text:lower(), "token:") and u.Text ~= "Token: " .. cc then
                        u.Text = "Token: " .. cc
                    elseif u.Text ~= cc and not string.find(u.Text:lower(), "token") then
                        u.Text = cc
                    end
                end)
            end
        end
        task.wait(0.05)
    end
end)
