--[[
    TRUST MENU - Key System Loader
    ==========================================================
    المفتاح الدائم: SOUTH-BX-TRUST
    الروابط: مستودع nadmksa123456-lgtm/My-Scripts
==============================================================]]

--========================= الخدمات =========================
local Players           = game:GetService("Players")
local CoreGui           = game:GetService("CoreGui")
local UserInputService  = game:GetService("UserInputService")

local LocalPlayer = Players.LocalPlayer

--========================= الثوابت =========================
local COLORS = {
    Background   = Color3.fromRGB(21, 21, 24),
    Text         = Color3.fromRGB(255, 255, 255),
    Element      = Color3.fromRGB(30, 30, 35),
    ElementLight = Color3.fromRGB(45, 45, 55),
    Placeholder  = Color3.fromRGB(120, 120, 130),
    Error        = Color3.fromRGB(255, 80, 80),
    Success      = Color3.fromRGB(100, 255, 100),
    Danger       = Color3.fromRGB(255, 100, 100),
    DangerBtn    = Color3.fromRGB(180, 50, 50),
    Dim          = Color3.fromRGB(10, 10, 12),
}

local DISCORD_LINK = "https://dsc.gg/cloud-ware"

-- 🔗 روابط السكربتات من مستودعك
local SCRIPT_LIMITED = "https://raw.githubusercontent.com/nadmksa123456-lgtm/My-Scripts/main/obfuscated_script-1782489174868.deobf.lua"
local SCRIPT_FULL    = "https://raw.githubusercontent.com/nadmksa123456-lgtm/My-Scripts/main/CW%20SB%20Full%20(bannable).deobf.lua"

-- 🔑 مفتاح دائم
local PERMANENT_KEY = "SOUTH-BX-TRUST"

local function getCurrentKey()
    return PERMANENT_KEY
end

--========================= أدوات مساعدة =========================
local function corner(parent, radius)
    local c = Instance.new("UICorner")
    c.CornerRadius = UDim.new(0, radius)
    c.Parent = parent
    return c
end

local function makeDraggable(window, handle)
    local dragging, dragInput, dragStart, startPos

    handle.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1
        or input.UserInputType == Enum.UserInputType.Touch then
            dragging  = true
            dragStart = input.Position
            startPos  = window.Position

            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)

    handle.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement
        or input.UserInputType == Enum.UserInputType.Touch then
            dragInput = input
        end
    end)

    UserInputService.InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            local delta = input.Position - dragStart
            window.Position = UDim2.new(
                startPos.X.Scale, startPos.X.Offset + delta.X,
                startPos.Y.Scale, startPos.Y.Offset + delta.Y
            )
        end
    end)
end

--========================= ScreenGui =========================
local screenGui = Instance.new("ScreenGui")
screenGui.Name          = "TRUST_MENU_KeySystem"
screenGui.ResetOnSpawn  = false
screenGui.Parent        = CoreGui

--========================= نافذة المفتاح =========================
local keyWindow = Instance.new("Frame")
keyWindow.Name              = "KeyWindow"
keyWindow.Size              = UDim2.new(0, 400, 0, 240)
keyWindow.Position          = UDim2.new(0.5, -200, 0.5, -120)
keyWindow.BackgroundColor3  = COLORS.Background
keyWindow.BorderSizePixel   = 0
keyWindow.Visible           = false
keyWindow.Parent            = screenGui
corner(keyWindow, 10)

local keyTitle = Instance.new("TextLabel")
keyTitle.Name                   = "Title"
keyTitle.Size                   = UDim2.new(0, 200, 0, 45)
keyTitle.Position               = UDim2.new(0, 20, 0, 5)
keyTitle.BackgroundTransparency = 1
keyTitle.Text                   = "TRUST MENU"
keyTitle.TextColor3             = COLORS.Text
keyTitle.Font                   = Enum.Font.GothamBold
keyTitle.TextSize               = 20
keyTitle.TextXAlignment         = Enum.TextXAlignment.Left
keyTitle.Parent                 = keyWindow

local keyClose = Instance.new("TextButton")
keyClose.Name               = "CloseBtn"
keyClose.Size               = UDim2.new(0, 26, 0, 26)
keyClose.Position           = UDim2.new(1, -40, 0, 15)
keyClose.BackgroundColor3   = COLORS.Text
keyClose.Text               = "x"
keyClose.TextColor3         = COLORS.Background
keyClose.Font               = Enum.Font.GothamBold
keyClose.TextSize           = 16
keyClose.Parent             = keyWindow
corner(keyClose, 6)

keyClose.MouseButton1Click:Connect(function()
    screenGui:Destroy()
end)

makeDraggable(keyWindow, keyTitle)

local keyBox = Instance.new("TextBox")
keyBox.Size              = UDim2.new(1, -40, 0, 45)
keyBox.Position          = UDim2.new(0, 20, 0, 70)
keyBox.BackgroundColor3  = COLORS.Element
keyBox.BorderSizePixel   = 0
keyBox.PlaceholderText   = "Enter Activation Key Here..."
keyBox.Text              = ""
keyBox.TextColor3        = COLORS.Text
keyBox.PlaceholderColor3 = COLORS.Placeholder
keyBox.Font              = Enum.Font.Gotham
keyBox.TextSize          = 14
keyBox.Parent            = keyWindow
corner(keyBox, 8)

local checkBtn = Instance.new("TextButton")
checkBtn.Size             = UDim2.new(0, 175, 0, 45)
checkBtn.Position         = UDim2.new(0, 20, 0, 140)
checkBtn.BackgroundColor3 = COLORS.Element
checkBtn.Text             = "Check Key"
checkBtn.TextColor3       = COLORS.Text
checkBtn.Font             = Enum.Font.GothamMedium
checkBtn.TextSize         = 14
checkBtn.Parent           = keyWindow
corner(checkBtn, 8)

local getKeyBtn = Instance.new("TextButton")
getKeyBtn.Size             = UDim2.new(0, 175, 0, 45)
getKeyBtn.Position         = UDim2.new(1, -195, 0, 140)
getKeyBtn.BackgroundColor3 = COLORS.Element
getKeyBtn.Text             = "Get Key (Discord)"
getKeyBtn.TextColor3       = COLORS.Text
getKeyBtn.Font             = Enum.Font.GothamMedium
getKeyBtn.TextSize         = 14
getKeyBtn.Parent           = keyWindow
corner(getKeyBtn, 8)

local statusLabel = Instance.new("TextLabel")
statusLabel.Size                   = UDim2.new(1, -40, 0, 20)
statusLabel.Position               = UDim2.new(0, 20, 0, 200)
statusLabel.BackgroundTransparency = 1
statusLabel.Text                   = ""
statusLabel.TextColor3             = COLORS.Error
statusLabel.Font                   = Enum.Font.Gotham
statusLabel.TextSize               = 12
statusLabel.Parent                 = keyWindow

--========================= نافذة اختيار السكربت =========================
local selectWindow = Instance.new("Frame")
selectWindow.Name             = "ScriptSelectWindow"
selectWindow.Size             = UDim2.new(0, 450, 0, 200)
selectWindow.Position         = UDim2.new(0.5, -225, 0.5, -100)
selectWindow.BackgroundColor3 = COLORS.Background
selectWindow.BorderSizePixel  = 0
selectWindow.Visible          = false
selectWindow.Parent           = screenGui
corner(selectWindow, 10)

local selTitle = Instance.new("TextLabel")
selTitle.Name                   = "Title"
selTitle.Size                   = UDim2.new(0, 200, 0, 45)
selTitle.Position               = UDim2.new(0, 20, 0, 5)
selTitle.BackgroundTransparency = 1
selTitle.Text                   = "TRUST MENU"
selTitle.TextColor3             = COLORS.Text
selTitle.Font                   = Enum.Font.GothamBold
selTitle.TextSize               = 20
selTitle.TextXAlignment         = Enum.TextXAlignment.Left
selTitle.Parent                 = selectWindow

local selClose = Instance.new("TextButton")
selClose.Name             = "CloseBtn"
selClose.Size             = UDim2.new(0, 26, 0, 26)
selClose.Position         = UDim2.new(1, -40, 0, 15)
selClose.BackgroundColor3 = COLORS.Text
selClose.Text             = "x"
selClose.TextColor3       = COLORS.Background
selClose.Font             = Enum.Font.GothamBold
selClose.TextSize         = 16
selClose.Parent           = selectWindow
corner(selClose, 6)

selClose.MouseButton1Click:Connect(function()
    screenGui:Destroy()
end)

makeDraggable(selectWindow, selTitle)

local limitedBtn = Instance.new("TextButton")
limitedBtn.Size             = UDim2.new(0, 195, 0, 80)
limitedBtn.Position         = UDim2.new(0, 20, 0, 75)
limitedBtn.BackgroundColor3 = COLORS.Element
limitedBtn.Text             = "Limited [No ban risk]"
limitedBtn.TextColor3       = COLORS.Success
limitedBtn.Font             = Enum.Font.GothamBold
limitedBtn.TextSize         = 14
limitedBtn.Parent           = selectWindow
corner(limitedBtn, 8)

local fullBtn = Instance.new("TextButton")
fullBtn.Size             = UDim2.new(0, 195, 0, 80)
fullBtn.Position         = UDim2.new(1, -215, 0, 75)
fullBtn.BackgroundColor3 = COLORS.Element
fullBtn.Text             = "Full [High Ban Risk]"
fullBtn.TextColor3       = COLORS.Danger
fullBtn.Font             = Enum.Font.GothamBold
fullBtn.TextSize         = 14
fullBtn.Parent           = selectWindow
corner(fullBtn, 8)

--========================= نافذة التأكيد =========================
local overlay = Instance.new("Frame")
overlay.Size                   = UDim2.new(1, 0, 1, 0)
overlay.BackgroundColor3       = COLORS.Dim
overlay.BackgroundTransparency = 0.4
overlay.Visible                = false
overlay.BorderSizePixel        = 0
overlay.Parent                 = selectWindow
corner(overlay, 10)

local confirmBox = Instance.new("Frame")
confirmBox.Size             = UDim2.new(0, 320, 0, 150)
confirmBox.Position         = UDim2.new(0.5, -160, 0.5, -75)
confirmBox.BackgroundColor3 = COLORS.Background
confirmBox.Parent           = overlay
corner(confirmBox, 8)

local confirmText = Instance.new("TextLabel")
confirmText.Size                   = UDim2.new(1, -30, 0, 60)
confirmText.Position               = UDim2.new(0, 15, 0, 15)
confirmText.BackgroundTransparency = 1
confirmText.Text                   = "Are you absolutely sure? This version contains risky functions and can lead to an account ban."
confirmText.TextColor3             = COLORS.Text
confirmText.Font                   = Enum.Font.GothamMedium
confirmText.TextSize               = 13
confirmText.TextWrapped            = true
confirmText.Parent                 = confirmBox

local yesBtn = Instance.new("TextButton")
yesBtn.Size             = UDim2.new(0, 120, 0, 35)
yesBtn.Position         = UDim2.new(0, 25, 0, 95)
yesBtn.BackgroundColor3 = COLORS.DangerBtn
yesBtn.Text             = "Yes, run"
yesBtn.TextColor3       = COLORS.Text
yesBtn.Font             = Enum.Font.GothamBold
yesBtn.TextSize         = 13
yesBtn.Parent           = confirmBox
corner(yesBtn, 6)

local cancelBtn = Instance.new("TextButton")
cancelBtn.Size             = UDim2.new(0, 120, 0, 35)
cancelBtn.Position         = UDim2.new(1, -145, 0, 95)
cancelBtn.BackgroundColor3 = COLORS.Element
cancelBtn.Text             = "Cancel"
cancelBtn.TextColor3       = COLORS.Text
cancelBtn.Font             = Enum.Font.GothamBold
cancelBtn.TextSize         = 13
cancelBtn.Parent           = confirmBox
corner(cancelBtn, 6)

--========================= المنطق =========================

getKeyBtn.MouseButton1Click:Connect(function()
    setclipboard(DISCORD_LINK)
    statusLabel.TextColor3 = COLORS.Success
    statusLabel.Text = "Link copied to clipboard!"
    task.wait(2)
    statusLabel.Text = ""
end)

checkBtn.MouseButton1Click:Connect(function()
    if keyBox.Text == getCurrentKey() then
        statusLabel.TextColor3 = COLORS.Success
        statusLabel.Text = "Success! Access granted."
        task.wait(0.5)
        keyWindow.Visible    = false
        selectWindow.Visible = true
    else
        statusLabel.TextColor3 = COLORS.Error
        statusLabel.Text = "Invalid Key! Please check again."
    end
end)

limitedBtn.MouseButton1Click:Connect(function()
    screenGui:Destroy()
    loadstring(game:HttpGet(SCRIPT_LIMITED))()
end)

fullBtn.MouseButton1Click:Connect(function()
    overlay.Visible = true
end)

cancelBtn.MouseButton1Click:Connect(function()
    overlay.Visible = false
end)

yesBtn.MouseButton1Click:Connect(function()
    screenGui:Destroy()
    loadstring(game:HttpGet(SCRIPT_FULL))()
end)

--========================= بدء التشغيل =========================
keyWindow.Visible = true
