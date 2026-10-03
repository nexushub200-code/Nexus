if _G.TLoop then _G.TLoop = false task.wait(0.2) end
if game.CoreGui:FindFirstChild("DeltaVisualHubV7") then game.CoreGui.DeltaVisualHubV7:Destroy() end
local TS = game:GetService("TweenService")
local tInfo = TweenInfo.new(0.3, Enum.EasingStyle.Quint, Enum.EasingDirection.Out)
local function fCom(n)
    local f = tostring(n):gsub(",", "")
    while true do local k; f, k = string.gsub(f, "^(-?%d+)(%d%d%d)", '%1,%2') if (k == 0) then break end end
    return f
end
local SG = Instance.new("ScreenGui", game.CoreGui) SG.Name = "DeltaVisualHubV7" SG.ResetOnSpawn = false
local MF = Instance.new("Frame", SG) MF.Size = UDim2.new(0, 350, 0, 280) MF.Position = UDim2.new(0.5, -175, 0.4, -140) MF.BackgroundColor3 = Color3.fromRGB(15, 15, 15) MF.Active = true MF.Draggable = true
local MC = Instance.new("UICorner", MF) MC.CornerRadius = UDim.new(0, 10)
local ST = Instance.new("UIStroke", MF) ST.Color = Color3.fromRGB(16, 185, 129) ST.Thickness = 2
local TL = Instance.new("TextLabel", MF) TL.Size = UDim2.new(1, 0, 0, 40) TL.BackgroundColor3 = Color3.fromRGB(10, 10, 10) TL.Text = "  NEXUS HUB v7.3 [SMOOTH TWEEN]" TL.TextColor3 = Color3.fromRGB(16, 185, 129) TL.TextSize = 12 TL.Font = Enum.Font.Code TL.TextXAlignment = Enum.TextXAlignment.Left
local TC = Instance.new("UICorner", TL) TC.CornerRadius = UDim.new(0, 10)
local CB = Instance.new("TextButton", MF) CB.Size = UDim2.new(0, 25, 0, 25) CB.Position = UDim2.new(1, -35, 0, 7) CB.BackgroundColor3 = Color3.fromRGB(239, 68, 68) CB.Text = "X" CB.TextColor3 = Color3.fromRGB(255, 255, 255) CB.Font = Enum.Font.SourceSansBold
Instance.new("UICorner", CB).CornerRadius = UDim.new(0, 5)
local MB = Instance.new("TextButton", MF) MB.Size = UDim2.new(0, 25, 0, 25) MB.Position = UDim2.new(1, -65, 0, 7) MB.BackgroundColor3 = Color3.fromRGB(40, 40, 40) MB.Text = "-" MB.TextColor3 = Color3.fromRGB(200, 200, 200) MB.Font = Enum.Font.SourceSansBold
Instance.new("UICorner", MB).CornerRadius = UDim.new(0, 5)
local NB = Instance.new("TextButton", SG) NB.Size = UDim2.new(0, 0, 0, 0) NB.Position = UDim2.new(0, 10, 0.5, -20) NB.BackgroundColor3 = Color3.fromRGB(25, 10, 15) NB.Text = "N" NB.TextColor3 = Color3.fromRGB(239, 68, 68) NB.TextSize = 0 NB.Font = Enum.Font.Code NB.Active = true NB.Draggable = true NB.Visible = false
Instance.new("UICorner", NB).CornerRadius = UDim.new(0, 8)
local NS = Instance.new("UIStroke", NB) NS.Color = Color3.fromRGB(147, 51, 234) NS.Thickness = 1.5
CB.MouseButton1Click:Connect(function() _G.TLoop = false TS:Create(MF, tInfo, {Size = UDim2.new(0, 0, 0, 0)}):Play() task.wait(0.3) SG:Destroy() end)
MB.MouseButton1Click:Connect(function() TS:Create(MF, tInfo, {Size = UDim2.new(0, 0, 0, 0)}):Play() task.wait(0.15) MF.Visible = false NB.Visible = true TS:Create(NB, tInfo, {Size = UDim2.new(0, 40, 0, 40), TextSize = 18}):Play() end)
NB.MouseButton1Click:Connect(function() TS:Create(NB, tInfo, {Size = UDim2.new(0, 0, 0, 0), TextSize = 0}):Play() task.wait(0.15) NB.Visible = false MF.Visible = true TS:Create(MF, tInfo, {Size = UDim2.new(0, 350, 0, 280)}):Play() end)
local L1 = Instance.new("TextLabel", MF) L1.Size = UDim2.new(0, 150, 0, 30) L1.Position = UDim2.new(0, 20, 0, 55) L1.BackgroundTransparency = 1 L1.Text = "Token Spawner Status:" L1.TextColor3 = Color3.fromRGB(200, 200, 200) L1.TextSize = 12 L1.Font = Enum.Font.Code L1.TextXAlignment = Enum.TextXAlignment.Left
local TB = Instance.new("TextButton", MF) TB.Size = UDim2.new(0, 100, 0, 30) TB.Position = UDim2.new(1, -120, 0, 55) TB.BackgroundColor3 = Color3.fromRGB(239, 68, 68) TB.Text = "STATUS: OFF" TB.TextColor3 = Color3.fromRGB(255, 255, 255) TB.TextSize = 11 TB.Font = Enum.Font.Code
Instance.new("UICorner", TB).CornerRadius = UDim.new(0, 5)
local TX = Instance.new("TextBox", MF) TX.Size = UDim2.new(1, -40, 0, 35) TX.Position = UDim2.new(0, 20, 0, 100) TX.BackgroundColor3 = Color3.fromRGB(5, 5, 5) TX.Text = "71619181" TX.TextColor3 = Color3.fromRGB(255, 255, 255) TX.TextSize = 14 TX.Font = Enum.Font.Code
Instance.new("UICorner", TX).CornerRadius = UDim.new(0, 5)
local AB = Instance.new("TextButton", MF) AB.Size = UDim2.new(1, -40, 0, 45) AB.Position = UDim2.new(0, 20, 0, 150) AB.BackgroundColor3 = Color3.fromRGB(40, 40, 40) AB.Text = "⚡ APPLY TOKEN ⚡" AB.TextColor3 = Color3.fromRGB(150, 150, 150) AB.TextSize = 12 AB.Font = Enum.Font.Code
Instance.new("UICorner", AB).CornerRadius = UDim.new(0, 5)
local CL = Instance.new("TextLabel", MF) CL.Size = UDim2.new(1, -40, 0, 55) CL.Position = UDim2.new(0, 20, 0, 210) CL.BackgroundColor3 = Color3.fromRGB(5, 5, 5) CL.Text = " >> System Idle. Please turn ON the status toggle first." CL.TextColor3 = Color3.fromRGB(150, 150, 150) CL.TextSize = 11 CL.Font = Enum.Font.Code CL.TextXAlignment = Enum.TextXAlignment.Left CL.TextWrapped = true
Instance.new("UICorner", CL).CornerRadius = UDim.new(0, 5)
local isOn, cText, p = false, "", game.Players.LocalPlayer
local o1, o2, o3 = nil, nil, nil
local function lockUI()
    pcall(function()
        for _, u in pairs(p.PlayerGui:GetDescendants()) do
            if u:IsA("TextLabel") or u:IsA("TextBox") then
                if u.Text == "1,526" or string.find(u.Text, "71,619") or string.find(u.Text, "92,927") or string.find(u.Text, "9,999") then if u.Parent.Name ~= "TopBar" and u.Parent.Name ~= "Title" and not string.find(u.Text, "Tokens:") then o1 = u end end
                if string.find(u.Text, "Tokens:") and u.Parent.Name ~= "TopBar" then if not string.find(u.Text, "Add") then o2 = u end end
                if string.find(u.Text, "Tokens:") and (u.Parent.Name == "TopBar" or string.find(string.lower(u.Parent.Name), "shop") or string.find(string.lower(u.Parent.Name), "header")) then o3 = u end
            end
        end
    end)
end
TB.MouseButton1Click:Connect(function()
    isOn = not isOn
    if isOn then
        TS:Create(TB, tInfo, {BackgroundColor3 = Color3.fromRGB(16, 185, 129)}):Play()
        TS:Create(AB, tInfo, {BackgroundColor3 = Color3.fromRGB(16, 185, 129)}):Play()
        TB.Text, AB.TextColor3 = "STATUS: ON", Color3.fromRGB(255, 255, 255)
        CL.Text, CL.TextColor3 = " >> Toggle ON. Tri-UI Core Lock Engaged.", Color3.fromRGB(250, 200, 50)
        lockUI()
    else
        TS:Create(TB, tInfo, {BackgroundColor3 = Color3.fromRGB(239, 68, 68)}):Play()
        TS:Create(AB, tInfo, {BackgroundColor3 = Color3.fromRGB(40, 40, 40)}):Play()
        TB.Text, AB.TextColor3 = "STATUS: OFF", Color3.fromRGB(150, 150, 150)
        CL.Text, CL.TextColor3 = " >> Toggle OFF.Paused.", Color3.fromRGB(239, 68, 68)
    end
end)
AB.MouseButton1Click:Connect(function()
    if not isOn then CL.Text = " >> ERROR: Switch is OFF!" CL.TextColor3 = Color3.fromRGB(239, 68, 68) return end
    lockUI() cText = TX.Text:gsub(",", "") local cc = fCom(cText)
    if o1 then o1.Text = cc end if o2 then o2.Text = "Tokens: " .. cc end if o3 then o3.Text = "Tokens: " .. cc end
    CL.Text, CL.TextColor3 = " >> SUCCESS! Injected: [" .. cc .. "]", Color3.fromRGB(16, 185, 129)
end)
_G.TLoop = true
task.spawn(function()
    while _G.TLoop do
        if isOn and cText ~= "" then
            pcall(function()
                local cc = fCom(cText)
                if o1 and o1.Text ~= cc then o1.Text = cc end
                if o2 and o2.Text ~= "Tokens: " .. cc then o2.Text = "Tokens: " .. cc end
                if o3 and o3.Text ~= "Tokens: " .. cc then o3.Text = "Tokens: " .. cc end
            end)
        end
        task.wait(0.03)
    end
end)
