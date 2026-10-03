if _G.TLoop then
    _G.TLoop = false
    task.wait(0.2)
end

if game.CoreGui:FindFirstChild("DeltaVisualHubV7") then
    game.CoreGui.DeltaVisualHubV7:Destroy()
end

local TS = game:GetService("TweenService")
local tInfo = TweenInfo.new(0.3, Enum.EasingStyle.Quint, Enum.EasingDirection.Out)

local function fCom(n)
    local f = tostring(n):gsub(",", "")
    while true do
        local k
        f, k = string.gsub(f, "^(-?%d+)(%d%d%d)", "%1,%2")
        if k == 0 then
            break
        end
    end
    return f
end

-- ScreenGui Setup
local SG = Instance.new("ScreenGui", game.CoreGui)
SG.Name = "DeltaVisualHubV7"
SG.ResetOnSpawn = false

-- Main Frame (Crimson Theme)
local MF = Instance.new("Frame", SG)
MF.Size = UDim2.new(0, 360, 0, 300)
MF.Position = UDim2.new(0.5, -180, 0.4, -150)
MF.BackgroundColor3 = Color3.fromRGB(18, 12, 12)
MF.Active = true
MF.Draggable = true

Instance.new("UICorner", MF).CornerRadius = UDim.new(0, 12)

local ST = Instance.new("UIStroke", MF)
ST.Color = Color3.fromRGB(150, 15, 25)
ST.Thickness = 2

-- Header Background
local HB = Instance.new("Frame", MF)
HB.Size = UDim2.new(1, 0, 0, 50)
HB.BackgroundColor3 = Color3.fromRGB(28, 15, 15)

local HBC = Instance.new("UICorner", HB)
HBC.CornerRadius = UDim.new(0, 12)

local HBF = Instance.new("Frame", HB)
HBF.Size = UDim2.new(1, 0, 0, 10)
HBF.Position = UDim2.new(0, 0, 1, -10)
HBF.BorderSizePixel = 0
HBF.BackgroundColor3 = Color3.fromRGB(28, 15, 15)

-- N Logo
local NL = Instance.new("TextLabel", HB)
NL.Size = UDim2.new(0, 30, 0, 30)
NL.Position = UDim2.new(0, 12, 0, 10)
NL.BackgroundColor3 = Color3.fromRGB(150, 15, 25)
NL.Text = "N"
NL.TextColor3 = Color3.fromRGB(255, 255, 255)
NL.TextSize = 18
NL.Font = Enum.Font.SourceSansBold

Instance.new("UICorner", NL).CornerRadius = UDim.new(0, 6)

-- Nexus Hub Title
local TL = Instance.new("TextLabel", HB)
TL.Size = UDim2.new(0, 200, 0, 20)
TL.Position = UDim2.new(0, 50, 0, 8)
TL.BackgroundTransparency = 1
TL.Text = "NEXUS HUB v7.3"
TL.TextColor3 = Color3.fromRGB(230, 30, 40)
TL.TextSize = 14
TL.Font = Enum.Font.Code
TL.TextXAlignment = Enum.TextXAlignment.Left

-- Credits Text
local CT = Instance.new("TextLabel", HB)
CT.Size = UDim2.new(0, 200, 0, 15)
CT.Position = UDim2.new(0, 50, 0, 26)
CT.BackgroundTransparency = 1
CT.Text = "by kingflame/nexus hub team"
CT.TextColor3 = Color3.fromRGB(150, 140, 140)
CT.TextSize = 10
CT.Font = Enum.Font.Code
CT.TextXAlignment = Enum.TextXAlignment.Left

-- Close Button
local CB = Instance.new("TextButton", HB)
CB.Size = UDim2.new(0, 25, 0, 25)
CB.Position = UDim2.new(1, -35, 0, 12)
CB.BackgroundColor3 = Color3.fromRGB(239, 68, 68)
CB.Text = "X"
CB.TextColor3 = Color3.fromRGB(255, 255, 255)
CB.Font = Enum.Font.SourceSansBold

Instance.new("UICorner", CB).CornerRadius = UDim.new(0, 6)

-- Minimize Button
local MB = Instance.new("TextButton", HB)
MB.Size = UDim2.new(0, 25, 0, 25)
MB.Position = UDim2.new(1, -65, 0, 12)
MB.BackgroundColor3 = Color3.fromRGB(45, 40, 40)
MB.Text = "-"
MB.TextColor3 = Color3.fromRGB(200, 200, 200)
MB.Font = Enum.Font.SourceSansBold

Instance.new("UICorner", MB).CornerRadius = UDim.new(0, 6)

-- Float / Mini Button
local NB = Instance.new("TextButton", SG)
NB.Size = UDim2.new(0, 0, 0, 0)
NB.Position = UDim2.new(0, 10, 0.5, -20)
NB.BackgroundColor3 = Color3.fromRGB(30, 10, 12)
NB.Text = "N"
NB.TextColor3 = Color3.fromRGB(230, 30, 40)
NB.TextSize = 0
NB.Font = Enum.Font.SourceSansBold
NB.Active = true
NB.Draggable = true
NB.Visible = false

Instance.new("UICorner", NB).CornerRadius = UDim.new(0, 8)

local NS = Instance.new("UIStroke", NB)
NS.Color = Color3.fromRGB(150, 15, 25)
NS.Thickness = 2

-- Body Controls
local L1 = Instance.new("TextLabel", MF)
L1.Size = UDim2.new(0, 160, 0, 30)
L1.Position = UDim2.new(0, 20, 0, 65)
L1.BackgroundTransparency = 1
L1.Text = "Visual Spoofer Status:"
L1.TextColor3 = Color3.fromRGB(200, 190, 190)
L1.TextSize = 12
L1.Font = Enum.Font.Code
L1.TextXAlignment = Enum.TextXAlignment.Left

-- Smooth Switch Toggle
local ToggleBG = Instance.new("TextButton", MF)
ToggleBG.Size = UDim2.new(0, 50, 0, 26)
ToggleBG.Position = UDim2.new(1, -70, 0, 67)
ToggleBG.BackgroundColor3 = Color3.fromRGB(45, 35, 35)
ToggleBG.Text = ""

Instance.new("UICorner", ToggleBG).CornerRadius = UDim.new(1, 0)

local ToggleStroke = Instance.new("UIStroke", ToggleBG)
ToggleStroke.Color = Color3.fromRGB(80, 60, 60)
ToggleStroke.Thickness = 1.5

-- Switch Circle
local ToggleCircle = Instance.new("Frame", ToggleBG)
ToggleCircle.Size = UDim2.new(0, 18, 0, 18)
ToggleCircle.Position = UDim2.new(0, 4, 0.5, -9)
ToggleCircle.BackgroundColor3 = Color3.fromRGB(180, 170, 170)

Instance.new("UICorner", ToggleCircle).CornerRadius = UDim.new(1, 0)

-- Text Box
local TX = Instance.new("TextBox", MF)
TX.Size = UDim2.new(1, -40, 0, 35)
TX.Position = UDim2.new(0, 20, 0, 110)
TX.BackgroundColor3 = Color3.fromRGB(12, 8, 8)
TX.Text = "82927291"
TX.TextColor3 = Color3.fromRGB(255, 255, 255)
TX.TextSize = 14
TX.Font = Enum.Font.Code

Instance.new("UICorner", TX).CornerRadius = UDim.new(0, 6)

local TXS = Instance.new("UIStroke", TX)
TXS.Color = Color3.fromRGB(60, 25, 25)
TXS.Thickness = 1

-- Number-Only Restriction Guard
TX:GetPropertyChangedSignal("Text"):Connect(function()
    local clean = TX.Text:gsub("%D", "")

    if TX.Text ~= clean then
        TX.Text = clean
    end
end)

-- Apply Button
local AB = Instance.new("TextButton", MF)
AB.Size = UDim2.new(1, -40, 0, 45)
AB.Position = UDim2.new(0, 20, 0, 160)
AB.BackgroundColor3 = Color3.fromRGB(45, 20, 22)
AB.Text = "⚡ INJECT VISUAL TOKENS ⚡"
AB.TextColor3 = Color3.fromRGB(180, 130, 130)
AB.TextSize = 12
AB.Font = Enum.Font.Code

Instance.new("UICorner", AB).CornerRadius = UDim.new(0, 6)

local ABS = Instance.new("UIStroke", AB)
ABS.Color = Color3.fromRGB(100, 20, 25)
ABS.Thickness = 1.5

-- Status Console Log
local CL = Instance.new("TextLabel", MF)
CL.Size = UDim2.new(1, -40, 0, 60)
CL.Position = UDim2.new(0, 20, 0, 220)
CL.BackgroundColor3 = Color3.fromRGB(10, 5, 5)
CL.Text = " >> System Idle. Toggle the crimson switch to begin."
CL.TextColor3 = Color3.fromRGB(140, 120, 120)
CL.TextSize = 11
CL.Font = Enum.Font.Code
CL.TextXAlignment = Enum.TextXAlignment.Left
CL.TextWrapped = true

Instance.new("UICorner", CL).CornerRadius = UDim.new(0, 6)

local CLS = Instance.new("UIStroke", CL)
CLS.Color = Color3.fromRGB(40, 15, 15)
CLS.Thickness = 1

-- Logic Variables
local isOn, cText, p = false, "", game.Players.LocalPlayer
local targets = {}

-- Window Control
CB.MouseButton1Click:Connect(function()
    _G.TLoop = false

    TS:Create(
        MF,
        tInfo,
        {Size = UDim2.new(0, 0, 0, 0)}
    ):Play()

    task.wait(0.3)
    SG:Destroy()
end)

MB.MouseButton1Click:Connect(function()
    TS:Create(
        MF,
        tInfo,
        {Size = UDim2.new(0, 0, 0, 0)}
    ):Play()

    task.wait(0.15)

    MF.Visible = false
    NB.Visible = true

    TS:Create(
        NB,
        tInfo,
        {
            Size = UDim2.new(0, 40, 0, 40),
            TextSize = 18
        }
    ):Play()
end)

NB.MouseButton1Click:Connect(function()
    TS:Create(
        NB,
        tInfo,
        {
            Size = UDim2.new(0, 0, 0, 0),
            TextSize = 0
        }
    ):Play()

    task.wait(0.15)

    NB.Visible = false
    MF.Visible = true

    TS:Create(
        MF,
        tInfo,
        {Size = UDim2.new(0, 360, 0, 300)}
    ):Play()
end)

-- Super Precise Filter
local function lockUI()
    targets = {}

    pcall(function()
        for _, u in pairs(p.PlayerGui:GetDescendants()) do
            if u:IsA("TextLabel") or u:IsA("TextBox") then

                local txt = u.Text
                local lowTxt = txt:lower()

                local pName =
                    u.Parent and
                    u.Parent.Name:lower() or ""

                local gpName =
                    u.Parent and
                    u.Parent.Parent and
                    u.Parent.Parent.Name:lower() or ""

                -- Location 1 & 2
                if string.find(lowTxt, "tokens:")
                    or string.find(lowTxt, "token:")
                    or pName == "tokens"
                    or pName == "token" then

                    table.insert(targets, u)

                -- Main panel numeric balance
                elseif string.find(txt, "^[%d,]+$")
                    and (
                        string.find(pName, "currency")
                        or string.find(pName, "main")
                        or string.find(pName, "top")
                        or string.find(pName, "bar")
                    ) then

                    if not string.find(lowTxt, "boost") then
                        table.insert(targets, u)
                    end

                -- Trading frame / panels
                elseif string.find(pName, "trade")
                    or string.find(gpName, "trade")
                    or string.find(pName, "deal") then

                    if string.find(lowTxt, "token")
                        or string.find(txt, "^[%d,]+$") then

                        table.insert(targets, u)
                    end
                end
            end
        end
    end)
end

-- Animated Switch Toggle
ToggleBG.MouseButton1Click:Connect(function()

    isOn = not isOn

    if isOn then

        TS:Create(
            ToggleCircle,
            tInfo,
            {
                Position = UDim2.new(1, -22, 0.5, -9),
                BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            }
        ):Play()

        TS:Create(
            ToggleBG,
            tInfo,
            {BackgroundColor3 = Color3.fromRGB(180, 20, 30)}
        ):Play()

        TS:Create(
            ToggleStroke,
            tInfo,
            {Color = Color3.fromRGB(255, 40, 50)}
        ):Play()

        TS:Create(
            AB,
            tInfo,
            {BackgroundColor3 = Color3.fromRGB(150, 15, 25)}
        ):Play()

        AB.TextColor3 = Color3.fromRGB(255, 255, 255)

        CL.Text =
            " >> Core Locked. UI Engine ready to inject."

        CL.TextColor3 =
            Color3.fromRGB(250, 180, 50)

        lockUI()

    else

        TS:Create(
            ToggleCircle,
            tInfo,
            {
                Position = UDim2.new(0, 4, 0.5, -9),
                BackgroundColor3 = Color3.fromRGB(180, 170, 170)
            }
        ):Play()

        TS:Create(
            ToggleBG,
            tInfo,
            {BackgroundColor3 = Color3.fromRGB(45, 35, 35)}
        ):Play()

        TS:Create(
            ToggleStroke,
            tInfo,
            {Color = Color3.fromRGB(80, 60, 60)}
        ):Play()

        TS:Create(
            AB,
            tInfo,
            {BackgroundColor3 = Color3.fromRGB(45, 20, 22)}
        ):Play()

        AB.TextColor3 =
            Color3.fromRGB(180, 130, 130)

        CL.Text =
            " >> System Paused. Tokens retained safely."

        CL.TextColor3 =
            Color3.fromRGB(239, 68, 68)
    end
end)

-- Inject Button Event
AB.MouseButton1Click:Connect(function()

    if not isOn then
        CL.Text =
            " >> ERROR: Turn ON the Crimson Switch first!"

        CL.TextColor3 =
            Color3.fromRGB(239, 68, 68)

        return
    end

    lockUI()

    cText = TX.Text:gsub(",", "")

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

    CL.Text =
        " >> INJECTED! Visual token matrix forced to ["
        .. cc
        .. "]."

    CL.TextColor3 =
        Color3.fromRGB(50, 220, 100)
end)

-- Background Persistence Loop
_G.TLoop = true

task.spawn(function()

    while _G.TLoop do

        if isOn and cText ~= "" then

            local cc = fCom(cText)

            for _, u in pairs(targets) do

                pcall(function()

                    if string.find(u.Text:lower(), "tokens:")
                        and u.Text ~= "Tokens: " .. cc then

                        u.Text = "Tokens: " .. cc

                    elseif string.find(u.Text:lower(), "token:")
                        and u.Text ~= "Token: " .. cc then

                        u.Text = "Token: " .. cc

                    elseif u.Text ~= cc
                        and not string.find(
                            u.Text:lower(),
                            "token"
                        ) then

                        u.Text = cc
                    end

                end)
            end
        end

        task.wait(0.05)
    end
end)
