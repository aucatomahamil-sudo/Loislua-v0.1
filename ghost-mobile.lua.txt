local plrs = game:GetService("Players")
local me = plrs.LocalPlayer
local input = game:GetService("UserInputService")
local run = game:GetService("RunService")
local camera = workspace.CurrentCamera
local tween = game:GetService("TweenService")
local light = game:GetService("Lighting")
local rp = game:GetService("ReplicatedStorage")
local content = game:GetService("ContentProvider")

local PlayersList = {}
local WhiteList = {}

local functions = {
  Fullbright = false,
  AutoOpenDoors = false,
  NoBarriers = false,
  NoGrinder = false,
  FastPickup = false,
  AutoPickupScraps = false,
  AutoPickupTools = false,
  AutopickupCrates = false,
  AutoPickupMoney = false,
  Infstamina = false,
  Nofalldamage = false,
  Noclip = false,
  FakeDown = true,
  Stopneckmove = false,
  Unbreaklimbs = false,
  SilentAim = false,
  AimBot = false,
  Instantreload = false,
  Meleeaura = false,
  RageBot = false,
  TrigerBot = false,
  RocketControl = false,
  ESP = false,
  ArmsChams = false,
  ToolsChams = false,
}

local SectionSettings = {
  SilentAim = {
    Draw = false,
    DrawSize = 50,
    DrawColor = Color3.new(1, 1, 1),
    TargetParts = {"Head"},
    CheckDowned = false,
    CheckWall = false,
    CheckTeam = false,
    CheckWhiteList = false,
  },
  Aimbot = {
    Draw = false,
    DrawSize = 50,
    DrawColor = Color3.new(1, 1, 1),
    TargetParts = {"Head"},
    CheckDowned = false,
    CheckWall = false,
    CheckTeam = false,
    CheckWhiteList = false,
    Velocity = false,
    Smooth = false,
    SmoothSize = 0.5
  },
  MeleeAura = {
    ShowAnim = false,
    TargetParts = {"Head"},
    CheckDowned = false,
    CheckTeam = false,
    CheckWhiteList = false,
    Distance = 15,
  },
  RageBot = {
    CheckDowned = false,
    CheckWhiteList = false
  },
  ESP = {
    Name = false,
    Box = false,
    Weapon = false,
    Highlught = false,
  }
}

local Methods = {
  Fly = "Bypass",
  Infstamina = "Getgc"
}

local index = {}
local index2 = {}
local sliderindex = {}

local cockie = {
  SilentAimCircle = nil,
  SilentAim_body = nil,
  ESPHighlight = nil,
  AimBotCircle = nil,
  aimbot_button = nil,
  Aimbot_body = nil,
  MeleeAura_body = nil,
}

local RUNS = {
  cameraFOV = nil,
  JumpHeight = nil,
  AutoOpenDoors = nil,
  AutopickupScraps = nil,
  AutopickupTools = nil,
  AutopickupCrates = nil,
  AutopickupMoney = nil,
  Infstamina = nil,
  Fly = nil,
  Noclip = nil,
  Meleeaura = nil,
  ESP = nil,
}

local funcindex = {
  Fullbright = {
    oldClockTime = nil,
    oldBrightness = nil,
  }
}

function Decrypt()
  local result = ""
  for i = 1, 50 do
    result = result..string.char(math.random(1, 200))
  end
  return result
end

local GUI = Instance.new("ScreenGui")
local Pcheck, Fcheck = pcall(function() GUI.Parent = game.CoreGui end) if Fcheck then GUI.Parent = me.PlayerGui end
GUI.Name = Decrypt()
GUI.ResetOnSpawn = false

local Menu = Instance.new("Frame")
Menu.Parent = GUI
Menu.Name = Decrypt()
Menu.BackgroundColor3 = Color3.new(0.0431373, 0.0431373, 0.0431373)
Menu.Position = UDim2.new(0.341, 0, 0.052, 0)
Menu.Size = UDim2.new(0.316, 0, 0.912, 0)
Menu.Active = true
Menu.Visible = true

local UICMenu = Instance.new("UICorner")
UICMenu.Parent = Menu
UICMenu.CornerRadius = UDim.new(0, 6)

local UISMenu = Instance.new("UIStroke")
UISMenu.Parent = Menu
UISMenu.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
UISMenu.Color = Color3.new(1, 0, 0)
UISMenu.LineJoinMode = Enum.LineJoinMode.Round
UISMenu.Thickness = 1.8

local dragg = Instance.new("Frame")
dragg.Parent = Menu
dragg.Name = Decrypt()
dragg.Active = true
dragg.BackgroundColor3 = Color3.new(0.0431373, 0.0431373, 0.0431373)
dragg.Position = UDim2.new(0, 0, 0, 0)
dragg.Size = UDim2.new(1, 0, 0.055, 0)
dragg.Active = true
dragg.Visible = true

local UICdragg = Instance.new("UICorner")
UICdragg.Parent = dragg
UICdragg.CornerRadius = UDim.new(0, 6)

local Ghost_Icon = Instance.new("ImageLabel")
Ghost_Icon.Parent = dragg
Ghost_Icon.Name = Decrypt()
Ghost_Icon.BackgroundTransparency = 1
Ghost_Icon.Position = UDim2.new(0, 3, 0.1, 0)
Ghost_Icon.Size = UDim2.new(0.078, 0, 0.914, 0)
Ghost_Icon.Image = "rbxassetid://83501732181441"
Ghost_Icon.Visible = true

local Ghost_Name = Instance.new("TextLabel")
Ghost_Name.Parent = dragg
Ghost_Name.Name = Decrypt()
Ghost_Name.BackgroundTransparency = 1
Ghost_Name.Position = UDim2.new(0.103, 0, 0.05, 0)
Ghost_Name.Size = UDim2.new(0.112, 0, 0.914, 0)
Ghost_Name.TextScaled = true
Ghost_Name.TextColor3 = Color3.new(1, 1, 1)
Ghost_Name.Text = "Ghost"
Ghost_Name.Visible = true

local UIGGhos_Name = Instance.new("UIGradient")
UIGGhos_Name.Parent = Ghost_Name
UIGGhos_Name.Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.new(1, 1, 1)), ColorSequenceKeypoint.new(1, Color3.new(1, 0, 0))})

local line1 = Instance.new("Frame")
line1.Parent = Menu
line1.Name = Decrypt()
line1.BackgroundColor3 = Color3.new(1, 0, 0)
line1.BorderColor3 = Color3.new(1, 0, 0)
line1.Position = UDim2.new(0, 0, 0.055, 0)
line1.Size = UDim2.new(0.998, 0, 0.0005, 0)
line1.Visible = true

local ScrollingMenus = Instance.new("ScrollingFrame")
ScrollingMenus.Parent = Menu
ScrollingMenus.BackgroundTransparency = 1
ScrollingMenus.Position = UDim2.new(0, 0, 0.056, 0)
ScrollingMenus.Size = UDim2.new(1, 0, 0.043, 0)
ScrollingMenus.ScrollBarThickness = 0
ScrollingMenus.ScrollingDirection = Enum.ScrollingDirection.X
ScrollingMenus.Visible = true

local UILScrolling = Instance.new("UIListLayout")
UILScrolling.Parent = ScrollingMenus
UILScrolling.Padding = UDim.new(0, 12)
UILScrolling.FillDirection = Enum.FillDirection.Horizontal
UILScrolling.SortOrder = Enum.SortOrder.LayoutOrder
UILScrolling.Wraps = false
UILScrolling.HorizontalAlignment = Enum.HorizontalAlignment.Left
UILScrolling.HorizontalFlex = Enum.UIFlexAlignment.None
UILScrolling.VerticalAlignment = Enum.VerticalAlignment.Top
UILScrolling.VerticalFlex = Enum.UIFlexAlignment.None

UILScrolling:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
  ScrollingMenus.CanvasSize = UDim2.new(0, (UILScrolling.AbsoluteContentSize.X * 1.03), 0, UILScrolling.AbsoluteContentSize.Y)
end)

local UIPScrolling = Instance.new("UIPadding")
UIPScrolling.Parent = ScrollingMenus
UIPScrolling.PaddingBottom = UDim.new(0, 0)
UIPScrolling.PaddingLeft = UDim.new(0, 7)
UIPScrolling.PaddingRight = UDim.new(0, 0)
UIPScrolling.PaddingTop = UDim.new(0.22, 0)

local line2 = Instance.new("Frame")
line2.Parent = Menu
line2.Name = Decrypt()
line2.BackgroundColor3 = Color3.new(1, 0, 0)
line2.BorderColor3 = Color3.new(1, 0, 0)
line2.Position = UDim2.new(0, 0, 0.1, 0)
line2.Size = UDim2.new(0.998, 0, 0.0005, 0)
line2.Visible = true

local MenusFolder = Instance.new("Folder")
MenusFolder.Parent = Menu
MenusFolder.Name = Decrypt()

local OpenClose = Instance.new("ImageButton")
OpenClose.Parent = GUI
OpenClose.Name = Decrypt()
OpenClose.BackgroundColor3 = Color3.new(0, 0, 0)
OpenClose.Position = UDim2.new(0.293, 0, 0.074, 0)
OpenClose.Size = UDim2.new(0.032, 0, 0.061, 0)
OpenClose.Image = "rbxassetid://71723095763813"
OpenClose.Visible = true

local UICOpenClose = Instance.new("UICorner")
UICOpenClose.Parent = OpenClose
UICOpenClose.CornerRadius = UDim.new(8, 8)

local UISOpenClose = Instance.new("UIStroke")
UISOpenClose.Parent = OpenClose
UISOpenClose.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
UISOpenClose.Color = Color3.new(1, 1, 1)
UISOpenClose.Thickness = 1

local UIAOpenClose = Instance.new("UIAspectRatioConstraint")
UIAOpenClose.Parent = OpenClose

function CharStats(plr)
  local folder = rp.CharStats[plr.Name]
  return folder
end

function Library()
  local Tabs = {}
  local Buttons = {}
  local Frames = {}

  function Tabs:MakeTab(Text)
    local TabButton = Instance.new("TextButton")
    TabButton.Parent = ScrollingMenus
    TabButton.Name = Decrypt()
    TabButton.BackgroundTransparency = 1
    TabButton.Size = UDim2.new(0.152, 0, 0.76, 0)
    TabButton.TextScaled = true
    TabButton.TextColor3 = Color3.new(1, 1, 1)
    TabButton.Text = Text
    TabButton.Visible = true

    local UICTabButton = Instance.new("UICorner")
    UICTabButton.Parent = TabButton
    UICTabButton.CornerRadius = UDim.new(0, 5)

    local UISTabButton = Instance.new("UIStroke")
    UISTabButton.Parent = TabButton
    UISTabButton.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    UISTabButton.Color = Color3.new(1, 0, 0)
    UISTabButton.Thickness = 1

    return TabButton
  end

  function Tabs:MakeScrollingMenu(Visible, button)
    local scroll = Instance.new("ScrollingFrame")
    scroll.Parent = MenusFolder
    scroll.Name = Decrypt()
    scroll.BackgroundTransparency = 1
    scroll.Position = UDim2.new(0, 0, 0.101, 0)
    scroll.Size = UDim2.new(0.998, 0, 0.898, 0)
    scroll.ScrollBarThickness = 0
    scroll.Visible = Visible

    button.MouseButton1Click:Connect(function()
      for _, a in pairs(MenusFolder:GetChildren()) do
        if a then
          a.Visible = false
        end
      end
      scroll.Visible = true
    end)

    return scroll
  end

  function Tabs:MakeFrameMenu(Visible, button)
    local frame = Instance.new("Frame")
    frame.Parent = MenusFolder
    frame.Name = Decrypt()
    frame.BackgroundTransparency = 1
    frame.Position = UDim2.new(0, 0, 0.101, 0)
    frame.Size = UDim2.new(1, 0, 0.899, 0)
    frame.Visible = Visible

    button.MouseButton1Click:Connect(function()
      for _, a in pairs(MenusFolder:GetChildren()) do
        if a then
          a.Visible = false
        end
      end
      frame.Visible = true
    end)

    return frame
  end

  function Tabs:MakeUIList(Parent)
    local UIList = Instance.new("UIListLayout")
    UIList.Parent = Parent
    UIList.Padding = UDim.new(0.02, 0)
    UIList.FillDirection = Enum.FillDirection.Vertical
    UIList.SortOrder = Enum.SortOrder.LayoutOrder
    UIList.HorizontalAlignment = Enum.HorizontalAlignment.Left
    UIList.HorizontalFlex = Enum.UIFlexAlignment.None
    UIList.VerticalAlignment = Enum.VerticalAlignment.Top
    UIList.VerticalFlex = Enum.UIFlexAlignment.None

    return UIList
  end

  function Tabs:MakeUIPadding(Parent)
    local UIPadding = Instance.new("UIPadding")
    UIPadding.Parent = Parent
    UIPadding.PaddingBottom = UDim.new(0, 0)
    UIPadding.PaddingLeft = UDim.new(0, 10)
    UIPadding.PaddingRight = UDim.new(0, 0)
    UIPadding.PaddingTop = UDim.new(0, 10)

    return UIPadding
  end

  function Tabs:MakeLeftBox(Parent)
    local _Left = Instance.new("Frame")
    _Left.Parent = Parent
    _Left.Name = Decrypt()
    _Left.BackgroundTransparency = 1
    _Left.Position = UDim2.new(0, 0, 0, 0)
    _Left.Size = UDim2.new(0.5, 0, 1, 0)
    _Left.Visible = true

    local UIL_Left = Instance.new("UIListLayout")
    UIL_Left.Parent = _Left
    UIL_Left.Padding = UDim.new(0.03, 0)
    UIL_Left.FillDirection = Enum.FillDirection.Vertical
    UIL_Left.SortOrder = Enum.SortOrder.LayoutOrder
    UIL_Left.HorizontalAlignment = Enum.HorizontalAlignment.Left
    UIL_Left.HorizontalFlex = Enum.UIFlexAlignment.None
    UIL_Left.VerticalAlignment = Enum.VerticalAlignment.Top
    UIL_Left.VerticalFlex = Enum.UIFlexAlignment.None

    local UIP_Left = Instance.new("UIPadding")
    UIP_Left.Parent = _Left
    UIP_Left.PaddingBottom = UDim.new(0, 0)
    UIP_Left.PaddingLeft = UDim.new(0, 20)
    UIP_Left.PaddingRight = UDim.new(0, 0)
    UIP_Left.PaddingTop = UDim.new(0, 10)

    return _Left
  end

  function Tabs:MakeRightBox(Parent)
    local _Right = Instance.new("Frame")
    _Right.Parent = Parent
    _Right.Name = Decrypt()
    _Right.BackgroundTransparency = 1
    _Right.Position = UDim2.new(0.5, 0, 0, 0)
    _Right.Size = UDim2.new(0.5, 0, 1, 0)
    _Right.Visible = true

    local UIL_Right = Instance.new("UIListLayout")
    UIL_Right.Parent = _Right
    UIL_Right.Padding = UDim.new(0.03, 0)
    UIL_Right.FillDirection = Enum.FillDirection.Vertical
    UIL_Right.SortOrder = Enum.SortOrder.LayoutOrder
    UIL_Right.HorizontalAlignment = Enum.HorizontalAlignment.Left
    UIL_Right.HorizontalFlex = Enum.UIFlexAlignment.None
    UIL_Right.VerticalAlignment = Enum.VerticalAlignment.Top
    UIL_Right.VerticalFlex = Enum.UIFlexAlignment.None

    local UIP_Right = Instance.new("UIPadding")
    UIP_Right.Parent = _Right
    UIP_Right.PaddingBottom = UDim.new(0, 0)
    UIP_Right.PaddingLeft = UDim.new(0, 10)
    UIP_Right.PaddingRight = UDim.new(0, 0)
    UIP_Right.PaddingTop = UDim.new(0, 10)

    return _Right
  end

  function Frames:MakeNotif(title, text, duration)
    for _, a in pairs(GUI:GetChildren()) do
      if a.Name == "Notif" then
        a:Destroy()
      end
    end

    local notif = Instance.new("Frame")
    notif.Parent = GUI
    notif.Name = "Notif"
    notif.BackgroundColor3 = Color3.new(1, 1, 1)
    notif.Position = UDim2.new(1, 0, 0.833, 0)
    notif.Size = UDim2.new(0.167, 0, 0.105, 0)
    notif.Visible = true

    local UICnotifFrame = Instance.new("UICorner")
    UICnotifFrame.Parent = notif
    UICnotifFrame.CornerRadius = UDim.new(0, 5)

    local UISnotifFrame = Instance.new("UIStroke")
    UISnotifFrame.Parent = notif
    UISnotifFrame.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    UISnotifFrame.Color = Color3.new(0, 0, 0)
    UISnotifFrame.Thickness = 1

    local UIGnotifFrame = Instance.new("UIGradient")
    UIGnotifFrame.Parent = notif
    UIGnotifFrame.Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.new(0.0666667, 0.0666667, 0.0666667)), ColorSequenceKeypoint.new(0.505, Color3.new(0.270588, 0.0509804, 0.0509804)), ColorSequenceKeypoint.new(1, Color3.new(1, 0, 0))})
    UIGnotifFrame.Rotation = 60
    UIGnotifFrame.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, 0.363), NumberSequenceKeypoint.new(0.216, 0.269), NumberSequenceKeypoint.new(0.7, 0.556), NumberSequenceKeypoint.new(1, 0.55)})

    local notifsound = Instance.new("Sound")
    notifsound.Parent = notif
    notifsound.SoundId = "rbxassetid://17208361335"
    notifsound.Volume = 1.5

    local notiftitle = Instance.new("TextLabel")
    notiftitle.Parent = notif
    notiftitle.Name = Decrypt()
    notiftitle.BackgroundTransparency = 1
    notiftitle.Position = UDim2.new(0, 0, 0, 0)
    notiftitle.Size = UDim2.new(1, 0, 0.325, 0)
    notiftitle.TextColor3 = Color3.new(1, 1, 1)
    notiftitle.TextScaled = true
    notiftitle.Font = Enum.Font.FredokaOne
    notiftitle.Text = title

    local notificon = Instance.new("ImageLabel")
    notificon.Parent = notif
    notificon.Name = Decrypt()
    notificon.BackgroundTransparency = 1
    notificon.Position = UDim2.new(0, 0, 0.338, 0)
    notificon.Size = UDim2.new(0.217, 0, 0.65, 0)
    notificon.Image = "rbxassetid://71723095763813"
    notificon.Visible = true

    local notiftext = Instance.new("TextLabel")
    notiftext.Parent = notif
    notiftext.Name = Decrypt()
    notiftext.BackgroundTransparency = 1
    notiftext.Position = UDim2.new(0.217, 0, 0.35, 0)
    notiftext.Size = UDim2.new(0.783, 0, 0.65, 0)
    notiftext.TextColor3 = Color3.new(1, 1, 1)
    notiftext.TextScaled = true
    notiftext.Text = text

    tween:Create(notif, TweenInfo.new(0.5), {Position = UDim2.new(0.821, 0, 0.833, 0)}):Play()
    notifsound:Play()
    task.delay(duration, function()
      notif:Destroy()
    end)
  end

  function Buttons:MakeDefaultButton(Parent, Text, data, func)
    local DText = Instance.new("TextLabel")
    DText.Parent = Parent
    DText.Name = Decrypt()
    DText.BackgroundTransparency = 1
    DText.Position = UDim2.new(0.039, 0, 0.122, 0)
    DText.Size = UDim2.new(0.493, 0, 0.019, 0)
    DText.TextScaled = true
    DText.TextColor3 = Color3.new(1, 1, 1)
    DText.Text = Text
    DText.Visible = true

    local UICDText = Instance.new("UICorner")
    UICDText.Parent = DText
    UICDText.CornerRadius = UDim.new(0, 6)

    local UISDText = Instance.new("UIStroke")
    UISDText.Parent = DText
    UISDText.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    UISDText.Color = Color3.new(1, 0, 0)
    UISDText.Thickness = 1

    local DController = Instance.new("Frame")
    DController.Parent = DText
    DController.Name = Decrypt()
    DController.BackgroundTransparency = 1
    DController.Position = UDim2.new(1.087, 0, 0, 0)
    DController.Size = UDim2.new(0.413, 0, 1, 0)
    DController.Visible = true

    local UICDController = Instance.new("UICorner")
    UICDController.Parent = DController
    UICDController.CornerRadius = UDim.new(8, 8)

    local UISDController = Instance.new("UIStroke")
    UISDController.Parent = DController
    UISDController.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    UISDController.Color = Color3.new(1, 0, 0)
    UISDController.Thickness = 1

    local DButton = Instance.new("TextButton")
    DButton.Parent = DController
    DButton.Name = Decrypt()
    DButton.BackgroundColor3 = Color3.new(1, 0, 0)
    DButton.Position = UDim2.new(0.07, 0, 0.071, 0)
    DButton.Size = UDim2.new(0.404, 0, 0.821, 0)
    DButton.Text = ""
    DButton.Visible = true

    local UICDButton = Instance.new("UICorner")
    UICDButton.Parent = DButton
    UICDButton.CornerRadius = UDim.new(8, 8)

    local UISDButton = Instance.new("UIStroke")
    UISDButton.Parent = DButton
    UISDButton.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    UISDButton.Color = Color3.new(1, 1, 1)
    UISDButton.Thickness = 1

    local UIADButton = Instance.new("UIAspectRatioConstraint")
    UIADButton.Parent = DButton

    DButton.MouseButton1Click:Connect(function()
      functions[data] = not functions[data]
      AnimateButtons(DButton, functions[data])
      func()
    end)

    local setindex = {button = DButton, data = data, func = func}
    table.insert(index, setindex)

    return DButton
  end

  function Frames:MakeSection(Parent)
    local section = Instance.new("Frame")
    section.Parent = Parent
    section.Name = Decrypt()
    section.BackgroundTransparency = 1
    section.Size = UDim2.new(0.9, 0, 0.3, 0)
    section.Visible = true

    local UICsection = Instance.new("UICorner")
    UICsection.Parent = section
    UICsection.CornerRadius = UDim.new(0, 5)

    local UISsection = Instance.new("UIStroke")
    UISsection.Parent = section
    UISsection.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    UISsection.Color = Color3.new(1, 0, 0)
    UISsection.Thickness = 1

    local UILsection = Instance.new("UIListLayout")
    UILsection.Parent = section
    UILsection.Padding = UDim.new(0, 10)
    UILsection.FillDirection = Enum.FillDirection.Vertical
    UILsection.SortOrder = Enum.SortOrder.LayoutOrder
    UILsection.HorizontalAlignment = Enum.HorizontalAlignment.Left
    UILsection.HorizontalFlex = Enum.UIFlexAlignment.None
    UILsection.VerticalAlignment = Enum.VerticalAlignment.Top
    UILsection.VerticalFlex = Enum.UIFlexAlignment.None

    local UIPsection = Instance.new("UIPadding")
    UIPsection.Parent = section
    UIPsection.PaddingBottom = UDim.new(0, 0)
    UIPsection.PaddingLeft = UDim.new(0, 10)
    UIPsection.PaddingRight = UDim.new(0, 0)
    UIPsection.PaddingTop = UDim.new(0, 10)

    UILsection:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
      section.Size = UDim2.new(0.9, 0, 0, UILsection.AbsoluteContentSize.Y + 15)
    end)

    return section
  end

  function Buttons:MakeSectionDefaultButton(Parent, Text, data, func)
    local text = Instance.new("TextLabel")
    text.Parent = Parent
    text.Name = Decrypt()
    text.BackgroundTransparency = 1
    text.Size = UDim2.new(0.57, 0, 0, 20)
    text.TextColor3 = Color3.new(1, 1, 1)
    text.TextScaled = true
    text.Text = Text
    text.Visible = true

    local UICtext = Instance.new("UICorner")
    UICtext.Parent = text
    UICtext.CornerRadius = UDim.new(0, 6)

    local UIStext = Instance.new("UIStroke")
    UIStext.Parent = text
    UIStext.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    UIStext.Color = Color3.new(1, 0, 0)
    UIStext.Thickness = 1

    local Turnbutton = Instance.new("TextButton")
    Turnbutton.Parent = text
    Turnbutton.Name = Decrypt()
    Turnbutton.BackgroundColor3 = Color3.new(1, 0, 0)
    Turnbutton.Position = UDim2.new(1.174, 0, -0.043, 0)
    Turnbutton.Size = UDim2.new(0.41, 0, 0, 18)
    Turnbutton.Text = ""
    Turnbutton.Visible = true

    local UICTurnbutton = Instance.new("UICorner")
    UICTurnbutton.Parent = Turnbutton
    UICTurnbutton.CornerRadius = UDim.new(8, 8)

    local UIATurnbutton = Instance.new("UIAspectRatioConstraint")
    UIATurnbutton.Parent = Turnbutton

    local UISTurnbutton = Instance.new("UIStroke")
    UISTurnbutton.Parent = Turnbutton
    UISTurnbutton.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    UISTurnbutton.Color = Color3.new(1, 1, 1)

    Turnbutton.MouseButton1Click:Connect(function()
      functions[data] = not functions[data]
      Turnbutton.BackgroundColor3 = functions[data] and Color3.new(0, 1, 0.0313725) or Color3.new(1, 0, 0)
      func()
    end)

    return Turnbutton
  end

  function Buttons:MakeSectionCheckboxButton(Parent, Text, funcname, data)
    local text = Instance.new("TextLabel")
    text.Parent = Parent
    text.Name = Decrypt()
    text.BackgroundTransparency = 1
    text.Size = UDim2.new(0, 76, 0, 20)
    text.TextColor3 = Color3.new(1, 1, 1)
    text.TextScaled = true
    text.Text = Text
    text.Visible = true

    local UICtext = Instance.new("UICorner")
    UICtext.Parent = text
    UICtext.CornerRadius = UDim.new(0, 6)

    local UIStext = Instance.new("UIStroke")
    UIStext.Parent = text
    UIStext.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    UIStext.Color = Color3.new(1, 0, 0)
    UIStext.Thickness = 1

    local Checkbox = Instance.new("ImageButton")
    Checkbox.Parent = text
    Checkbox.Name = Decrypt()
    Checkbox.BackgroundTransparency = 1
    Checkbox.Position = UDim2.new(1.186, 0, -0.043, 0)
    Checkbox.Size = UDim2.new(0.325, 0, 1.201, 0)
    Checkbox.Image = "rbxassetid://6218581738"
    Checkbox.Visible = true

    local UICCheckbox = Instance.new("UICorner")
    UICCheckbox.Parent = Checkbox
    UICCheckbox.CornerRadius = UDim.new(0, 5)

    local UIACheckbox = Instance.new("UIAspectRatioConstraint")
    UIACheckbox.Parent = Checkbox

    local UISCheckbox = Instance.new("UIStroke")
    UISCheckbox.Parent = Checkbox
    UISCheckbox.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    UISCheckbox.Color = Color3.new(1, 0, 0)
    UISCheckbox.Thickness = 1

    if SectionSettings[funcname][data] == true then
      Checkbox.ImageTransparency = 0
    else
      Checkbox.ImageTransparency = 1
    end

    Checkbox.MouseButton1Click:Connect(function()
      SectionSettings[funcname][data] = not SectionSettings[funcname][data]
      Checkbox.ImageTransparency = SectionSettings[funcname][data] and 0 or 1
    end)

    return Checkbox
  end

  function Frames:MakeSectionSlider(Parent, Text, startervalue, min, max, func)
    local text = Instance.new("TextLabel")
    text.Parent = Parent
    text.Name = Decrypt()
    text.BackgroundTransparency = 1
    text.Size = UDim2.new(0.257, 0, 0, 17)
    text.TextColor3 = Color3.new(1, 1, 1)
    text.TextScaled = true
    text.Text = Text
    text.Visible = true

    local Control = Instance.new("Frame")
    Control.Parent = text
    Control.Name = Decrypt()
    Control.BackgroundColor3 = Color3.new(0.129412, 0.129412, 0.129412)
    Control.Position = UDim2.new(1.154, 0, 0.063, 0)
    Control.Size = UDim2.new(2.071, 0, 0, 17)
    Control.Visible = true

    local UICControl = Instance.new("UICorner")
    UICControl.Parent = Control
    UICControl.CornerRadius = UDim.new(8, 8)

    local UISControl = Instance.new("UIStroke")
    UISControl.Parent = Control
    UISControl.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    UISControl.Color = Color3.new(1, 0, 0)
    UISControl.Thickness = 1

    local Slider = Instance.new("TextButton")
    Slider.Parent = Control
    Slider.Name = Decrypt()
    Slider.BackgroundColor3 = Color3.new(1, 1, 1)
    Slider.Position = UDim2.new(0, 0, 0, 0)
    Slider.Size = UDim2.new(math.clamp((startervalue - min)/(max - min), 0.1, 1), 0, 1)
    Slider.Text = ""
    Slider.Visible = true

    local UICSlider = Instance.new("UICorner")
    UICSlider.Parent = Slider
    UICSlider.CornerRadius = UDim.new(8, 8)

    local value = Instance.new("TextLabel")
    value.Parent = Control
    value.Name = Decrypt()
    value.BackgroundTransparency = 1
    value.Position = UDim2.new(1.076, 0, -0.04, 0)
    value.Size = UDim2.new(0.272, 0, 1, 0)
    value.TextColor3 = Color3.new(1, 1, 1)
    value.TextScaled = true
    value.Text = startervalue

    local slide = false

    Slider.MouseButton1Down:Connect(function()
      slide = true
    end)

    input.InputEnded:Connect(function(key)
      if key.UserInputType == Enum.UserInputType.Touch then
        slide = false
      end
    end)

    input.InputChanged:Connect(function(key)
      if (key.UserInputType == Enum.UserInputType.MouseMovement or key.UserInputType == Enum.UserInputType.Touch) and slide then
        local mousepos = input:GetMouseLocation().X
        local scale = (mousepos - Control.AbsolutePosition.X)/Control.AbsoluteSize.X
        local clamp = math.clamp(scale, 0.1, 1)
        tween:Create(Slider, TweenInfo.new(0.2), {Size = UDim2.fromScale(clamp, 1)}):Play()
        local clampvalue = math.clamp(min + (scale * (max - min)), min, max)
        if clampvalue < 10 then
          value.Text = string.format("%.2f", clampvalue)
        else
          value.Text = math.floor(clampvalue)
        end
        func(clampvalue)
      end
    end)
  end

  function Buttons:MakeSectionPressButton(Parent, Text, func)
    local text = Instance.new("TextLabel")
    text.Parent = Parent
    text.Name = Decrypt()
    text.BackgroundTransparency = 1
    text.Size = UDim2.new(0, 86, 0, 19)
    text.TextColor3 = Color3.new(1, 1, 1)
    text.TextScaled = true
    text.Text = Text
    text.Visible = true

    local UICtext = Instance.new("UICorner")
    UICtext.Parent = text
    UICtext.CornerRadius = UDim.new(0, 5)

    local UIStext = Instance.new("UIStroke")
    UIStext.Parent = text
    UIStext.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    UIStext.Color = Color3.new(1, 0, 0)
    UIStext.Thickness = 1

    local button = Instance.new("ImageButton")
    button.Parent = text
    button.Name = Decrypt()
    button.BackgroundTransparency = 1
    button.Position = UDim2.new(1.134, 0, -0.035, 0)
    button.Size = UDim2.new(0.273, 0, 1.194, 0)
    button.Image = "rbxassetid://2769398451"
    button.Visible = true

    local UIAbutton = Instance.new("UIAspectRatioConstraint")
    UIAbutton.Parent = button

    button.MouseButton1Click:Connect(function()
      if func then
        func()
      end
    end)
  end

  function Buttons:MakeColorWheelSection(Parent)
    local colorwheel = Instance.new("ImageButton")
    colorwheel.Parent = Parent
    colorwheel.Name = Decrypt()
    colorwheel.BackgroundTransparency = 1
    colorwheel.Position = UDim2.new(1.35, 0, -0.06, 0)
    colorwheel.Size = UDim2.new(0, 30, 0, 30)
    colorwheel.Image = "http://www.roblox.com/asset/?id=1003599877"

    return colorwheel
  end

  function Frames:MakeSlider(Parent, index, startervalue, min, max, func)
    local SliderText = Instance.new("TextLabel")
    SliderText.Parent = Parent
    SliderText.Name = Decrypt()
    SliderText.BackgroundTransparency = 1
    SliderText.Size = UDim2.new(0.308, 0, 0.045, 0)
    SliderText.TextScaled = true
    SliderText.TextColor3 = Color3.new(1, 1, 1)
    SliderText.Text = index
    SliderText.Visible = true

    local UICSliderText = Instance.new("UICorner")
    UICSliderText.Parent = SliderText
    UICSliderText.CornerRadius = UDim.new(0, 5)

    local UISSliderText = Instance.new("UIStroke")
    UISSliderText.Parent = SliderText
    UISSliderText.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    UISSliderText.Color = Color3.new(1, 0, 0)
    UISSliderText.Thickness = 1

    local SliderControl = Instance.new("Frame")
    SliderControl.Parent = SliderText
    SliderControl.Name = Decrypt()
    SliderControl.BackgroundColor3 = Color3.new(0.129412, 0.129412, 0.129412)
    SliderControl.Position = UDim2.new(1.203, 0, 0, 0)
    SliderControl.Size = UDim2.new(1.186, 0, 1.016, 0)
    SliderControl.Visible = true

    local UICSliderControl = Instance.new("UICorner")
    UICSliderControl.Parent = SliderControl
    UICSliderControl.CornerRadius = UDim.new(8, 8)

    local UISSliderControl = Instance.new("UIStroke")
    UISSliderControl.Parent = SliderControl
    UISSliderControl.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    UISSliderControl.Color = Color3.new(1, 0, 0)
    UISSliderControl.Thickness = 1

    local SliderButton = Instance.new("TextButton")
    SliderButton.Parent = SliderControl
    SliderButton.Name = Decrypt()
    SliderButton.BackgroundColor3 = Color3.new(0.870588, 0.870588, 0.870588)
    SliderButton.Position = UDim2.new(0, 0, 0, 0)
    SliderButton.Size = UDim2.new(math.clamp((startervalue - min)/(max - min), 0.1, 1), 0, 1)
    SliderButton.Text = ""
    SliderButton.Visible = true

    local UICSliderButton = Instance.new("UICorner")
    UICSliderButton.Parent = SliderButton
    UICSliderButton.CornerRadius = UDim.new(8, 8)

    local SliderValue = Instance.new("TextLabel")
    SliderValue.Parent = SliderControl
    SliderValue.BackgroundTransparency = 1
    SliderValue.Position = UDim2.new(1, 0, 0, 0)
    SliderValue.Size = UDim2.new(0.431, 0, 1, 0)
    SliderValue.TextScaled = true
    SliderValue.TextColor3 = Color3.new(1, 1, 1)
    SliderValue.Text = math.floor(startervalue)

    local canuse = false

    SliderButton.MouseButton1Down:Connect(function()
      canuse = true
    end)

    input.InputEnded:Connect(function(key)
      if key.UserInputType == Enum.UserInputType.MouseButton1 or key.UserInputType == Enum.UserInputType.Touch then
        canuse = false
      end
    end)

    input.InputChanged:Connect(function(key)
      if (key.UserInputType == Enum.UserInputType.MouseMovement or key.UserInputType == Enum.UserInputType.Touch) and canuse then
        local getmousepos = input:GetMouseLocation().X
        local scale = (getmousepos - SliderControl.AbsolutePosition.X)/SliderControl.AbsoluteSize.X
        local clamp = math.clamp(scale, 0.1, 1)
        tween:Create(SliderButton, TweenInfo.new(0.3), {Size = UDim2.fromScale(clamp, 1)}):Play()
        local value
        if min > max then
          value = math.clamp(min + (scale * (max - min)), max, min)
        else
          value = math.clamp(min + (scale * (max - min)), min, max)
        end
        if value <= 10 then
          local format = string.format("%.2f", value)
          SliderValue.Text = format
        else
          SliderValue.Text = math.floor(value)
        end
        func(value)
      end
    end)

    local data = {}

    return SliderText
  end

  function Buttons:MakeClickButton(Parent, Text, func)
    local presstext = Instance.new("TextLabel")
    presstext.Parent = Parent
    presstext.Name = Decrypt()
    presstext.BackgroundTransparency = 1
    presstext.Size = UDim2.new(0, 138, 0, 28)
    presstext.TextScaled = true
    presstext.TextColor3 = Color3.new(1, 1, 1)
    presstext.Text = Text
    presstext.Visible = true

    local UICpresstext = Instance.new("UICorner")
    UICpresstext.Parent = presstext
    UICpresstext.CornerRadius = UDim.new(0, 5)

    local UISpresstext = Instance.new("UIStroke")
    UISpresstext.Parent = presstext
    UISpresstext.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    UISpresstext.Color = Color3.new(1, 0, 0)
    UISpresstext.Thickness = 1

    local pressbutton = Instance.new("ImageButton")
    pressbutton.Parent = presstext
    pressbutton.Name = Decrypt()
    pressbutton.BackgroundTransparency = 1
    pressbutton.Position = UDim2.new(1.145, 0, -0.071, 0)
    pressbutton.Size = UDim2.new(0, 32, 0, 32)
    pressbutton.Image = "rbxassetid://2769398451"
    pressbutton.Visible = true

    pressbutton.MouseButton1Click:Connect(function()
      func()
    end)

    return pressbutton
  end

  function Frames:MakeSelectTab(Parent, Text, options, method)
    local button = Instance.new("TextButton")
    button.Parent = Parent
    button.Name = Decrypt()
    button.BackgroundTransparency = 1
    button.Size = UDim2.new(0.4, 0, 0.038, 0)
    button.TextScaled = true
    button.TextColor3 = Color3.new(1, 1, 1)
    button.Text = Text
    button.Visible = true

    local UICtext = Instance.new("UICorner")
    UICtext.Parent = button
    UICtext.CornerRadius = UDim.new(0, 3)

    local UIStext = Instance.new("UIStroke")
    UIStext.Parent = button
    UIStext.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    UIStext.Color = Color3.new(1, 0, 0)
    UIStext.Thickness = 1

    local Frame = Instance.new("Frame")
    Frame.Parent = button
    Frame.Name = Decrypt()
    Frame.BackgroundColor3 = Color3.new(0.0431373, 0.0431373, 0.0431373)
    Frame.Position = UDim2.new(0, 0, 1, 0)
    Frame.Size = UDim2.new(1.017, 0, 3.176, 0)
    Frame.ZIndex = 2
    Frame.Visible = false

    local UISFrame = Instance.new("UIStroke")
    UISFrame.Parent = Frame
    UISFrame.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    UISFrame.Color = Color3.new(1, 0, 0)
    UISFrame.Thickness = 1

    local UILFrame = Instance.new("UIListLayout")
    UILFrame.Parent = Frame
    UILFrame.Padding = UDim.new(0, 10)
    UILFrame.FillDirection = Enum.FillDirection.Vertical
    UILFrame.SortOrder = Enum.SortOrder.LayoutOrder
    UILFrame.HorizontalAlignment = Enum.HorizontalAlignment.Left
    UILFrame.HorizontalFlex = Enum.UIFlexAlignment.None
    UILFrame.VerticalAlignment = Enum.VerticalAlignment.Top
    UILFrame.VerticalFlex = Enum.UIFlexAlignment.None

    local UIPFrame = Instance.new("UIPadding")
    UIPFrame.Parent = Frame
    UIPFrame.PaddingBottom = UDim.new(0, 0)
    UIPFrame.PaddingLeft = UDim.new(0.07, 0)
    UIPFrame.PaddingRight = UDim.new(0, 0)
    UIPFrame.PaddingTop = UDim.new(0.05, 0)

    if options then
      for i, a in pairs(options) do
        local btn = Instance.new("TextButton")
        btn.Name = Decrypt()
        btn.Parent = Frame
        btn.BackgroundTransparency = 1
        btn.Size = UDim2.new(0.905, 0, 0.32, 0)
        btn.TextScaled = true
        btn.TextColor3 = Color3.new(1, 1, 1)
        btn.Text = a
        btn.ZIndex = 5
        btn.Visible = true

        local UISbutton = Instance.new("UIStroke")
        UISbutton.Parent = btn
        UISbutton.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
        UISbutton.Color = Color3.new(1, 0, 0)
        UISbutton.Thickness = 1

        btn.MouseButton1Click:Connect(function()
          Frame.Visible = false
          Methods[method] = a
          button.Text = a
        end)
      end
    end

    UILFrame:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
      Frame.Size = UDim2.new(1.017, 0, 0, UILFrame.AbsoluteContentSize.Y * 1.3)
    end)

    button.MouseButton1Click:Connect(function()
      Frame.Visible = not Frame.Visible
    end)

    return button
  end

  function Frames:MakeBodySelector(Table)
    local Body = Instance.new("Frame")
    Body.Parent = GUI
    Body.Name = "Body"
    Body.BackgroundColor3 = Color3.new(0, 0, 0)
    Body.Position = UDim2.new(0.715, 0, 0.131, 0)
    Body.Size = UDim2.new(0.3, 0, 0.3, 0)
    Body.Visible = true

    local uiabody = Instance.new("UIAspectRatioConstraint")
    uiabody.Parent = Body
    uiabody.AspectRatio = 1
    uiabody.AspectType = Enum.AspectType.FitWithinMaxSize
    uiabody.DominantAxis = Enum.DominantAxis.Width

    local Head = Instance.new("TextButton")
    Head.Parent = Body
    Head.Name = "Head"
    Head.BackgroundColor3 = Color3.new(1,1 , 1)
    Head.BorderColor3 = Color3.new(0, 0, 0)
    Head.BorderSizePixel = 2
    Head.Position = UDim2.new(0.394, 0, 0.055, 0)
    Head.Size = UDim2.new(0.203, 0, 0.203, 0)
    Head.Text = ""
    Head.Visible = true

    local Torso = Instance.new("TextButton")
    Torso.Parent = Body
    Torso.Name = "Torso"
    Torso.Position = UDim2.new(0.321, 0, 0.261, 0)
    Torso.Size = UDim2.new(0.344, 0, 0.344, 0)
    Torso.BackgroundColor3 = Color3.new(1, 1, 1)
    Torso.BorderColor3 = Color3.new(0, 0, 0)
    Torso.BorderSizePixel = 1
    Torso.Text = ""
    Torso.Visible = true

    local LeftArm = Instance.new("TextButton")
    LeftArm.Parent = Body
    LeftArm.Name = "LeftArm"
    LeftArm.BackgroundColor3 = Color3.new(1,1 , 1)
    LeftArm.Position = UDim2.new(0.665, 0, 0.261, 0)
    LeftArm.Size = UDim2.new(0.172, 0, 0.344, 0)
    LeftArm.Text = ""
    LeftArm.Visible = true

    local RightArm = Instance.new("TextButton")
    RightArm.Parent = Body
    RightArm.Name = "RightArm"
    RightArm.BackgroundColor3 = Color3.new(1, 1, 1)
    RightArm.Position = UDim2.new(0.147, 0, 0.261, 0)
    RightArm.Size = UDim2.new(0.172, 0, 0.344, 0)
    RightArm.Text = ""
    RightArm.Visible = true

    local LeftLeg = Instance.new("TextButton")
    LeftLeg.Parent = Body
    LeftLeg.Name = "LeftLeg"
    LeftLeg.BackgroundColor3 = Color3.new(1, 1, 1)
    LeftLeg.Position = UDim2.new(0.5, 0, 0.605, 0)
    LeftLeg.Size = UDim2.new(0.172, 0, 0.344, 0)
    LeftLeg.Text = ""
    LeftLeg.Visible = true

    local RightLeg = Instance.new("TextButton")
    RightLeg.Parent = Body
    RightLeg.Name = "RightLeg"
    RightLeg.BackgroundColor3 = Color3.new(1, 1, 1)
    RightLeg.Position = UDim2.new(0.321, 0, 0.605, 0)
    RightLeg.Size = UDim2.new(0.163, 0, 0.344, 0)
    RightLeg.Text = ""
    RightLeg.Visible = true

    local check1 = table.find(Table, "Head")
    local check2 = table.find(Table, "Torso")
    local check3 = table.find(Table, "Left Arm")
    local check4 = table.find(Table, "Right Arm")
    local check5 = table.find(Table, "Left Leg")
    local check6 = table.find(Table, "Right Leg")

    if check1 then
      Head.BackgroundColor3 = Color3.new(0.0666667, 1, 0)
    end

    if check2 then
      Torso.BackgroundColor3 = Color3.new(0, 1, 0.0313725)
    end

    if check3 then
      LeftArm.BackgroundColor3 = Color3.new(0.0666667, 1, 0)
    end

    if check4 then
      RightArm.BackgroundColor3 = Color3.new(0.133333, 1, 0)
    end

    if check5 then
      LeftLeg.BackgroundColor3 = Color3.new(0.101961, 1, 0)
    end

    if check6 then
      RightLeg.BackgroundColor3 = Color3.new(0.0156863, 1, 0)
    end

    Head.MouseButton1Click:Connect(function()
      local check = table.find(Table, "Head")
      if not check then
        table.insert(Table, "Head")
        Head.BackgroundColor3 = Color3.new(0.0509804, 1, 0)
      else
        table.remove(Table, check)
        Head.BackgroundColor3 = Color3.new(1, 1, 1)
      end
    end)

    Torso.MouseButton1Click:Connect(function()
      local check = table.find(Table, "Torso")
      if not check then
        table.insert(Table, "Torso")
        Torso.BackgroundColor3 = Color3.new(0.0666667, 1, 0)
      else
        table.remove(Table, check)
        Torso.BackgroundColor3 = Color3.new(1, 1, 1)
      end
    end)

    LeftArm.MouseButton1Click:Connect(function()
      local check = table.find(Table, "Left Arm")
      if not check then
        table.insert(Table, "Left Arm")
        LeftArm.BackgroundColor3 = Color3.new(0, 1, 0.0666667)
      else
        table.remove(Table, check)
        LeftArm.BackgroundColor3 = Color3.new(1, 1, 1)
      end
    end)

    RightArm.MouseButton1Click:Connect(function()
      local check = table.find(Table, "Right Arm")
      if not check then
        table.insert(Table, "Right Arm")
        RightArm.BackgroundColor3 = Color3.new(0, 1, 0.0823529)
      else
        table.remove(Table, check)
        RightArm.BackgroundColor3 = Color3.new(1, 1, 1)
      end
    end)

    LeftLeg.MouseButton1Click:Connect(function()
      local check = table.find(Table, "Left Leg")
      if not check then
        table.insert(Table, "Left Leg")
        LeftLeg.BackgroundColor3 = Color3.new(0, 1, 0.0666667)
      else
        table.remove(Table, check)
        LeftLeg.BackgroundColor3 = Color3.new(1, 1, 1)
      end
    end)

    RightLeg.MouseButton1Click:Connect(function()
      local check = table.find(Table, "Right Leg")
      if not check then
        table.insert(Table, "Right Leg")
        RightLeg.BackgroundColor3 = Color3.new(0.0156863, 1, 0)
      else
        table.remove(Table, check)
        RightLeg.BackgroundColor3 = Color3.new(1, 1, 1)
      end
    end)

    return Body
  end

  return {Tabs = Tabs, Buttons = Buttons, Frames = Frames}
end

local Library = Library()
local Tabs = Library.Tabs
local Buttons = Library.Buttons
local Frames = Library.Frames

Frames:MakeNotif("Welcome! 👻 ", "Join to our discord! \n discrod.gg/getghost", 10)

function AnimateButtons(button, value)
  local enabled = UDim2.new(0.5, 0, 0.071, 0)
  local disabled = UDim2.new(0.07, 0, 0.071, 0)

  if value == true then
    tween:Create(button, TweenInfo.new(0.2), {Position = enabled}):Play()
    button.BackgroundColor3 = Color3.new(0.184314, 1, 0)
  else
    tween:Create(button, TweenInfo.new(0.2), {Position = disabled}):Play()
    button.BackgroundColor3 = Color3.new(1, 0, 0)
  end
end

function AnimateButtons2(button, value)
  local enabled = UDim2.new(0.4, 0, 0.085, 0)
  local disabled = UDim2.new(0.07, 0, 0.085, 0)

  if value == true then
    tween:Create(button, TweenInfo.new(0.2), {Position = enabled}):Play()
    button.BackgroundColor3 = Color3.new(0.184314, 1, 0)
  else
    tween:Create(button, TweenInfo.new(0.2), {Position = disabled}):Play()
    button.BackgroundColor3 = Color3.new(1, 0, 0)
  end
end

local WorldTab = Tabs:MakeTab("World")
local PlayerTab = Tabs:MakeTab("Player")
local MainTab = Tabs:MakeTab("Main")
local VisualTab = Tabs:MakeTab("Visual")
--[[local SkinsTab = Tabs:MakeTab("Skins")
local FarmTab = Tabs:MakeTab("Farm")
local EventsTab = Tabs:MakeTab("Events")
local SettingsTab = Tabs:MakeTab("Settings")
local ConfigTab = Tabs:MakeTab("Config")]]

--// WORLD \\--
local MakeWorldMenu = Tabs:MakeFrameMenu(true, WorldTab)
local MakeWorldMenuUIList = Tabs:MakeUIList(MakeWorldMenu)
local MakeWorldMenuUIPadding = Tabs:MakeUIPadding(MakeWorldMenu)

--// PLAYER \\--
local MakePlayerMenu = Tabs:MakeFrameMenu(false, PlayerTab)
local MakePlayerMenuUIList = Tabs:MakeUIList(MakePlayerMenu)
local MakePlayerMenuUIPadding = Tabs:MakeUIPadding(MakePlayerMenu)

--// MAIN \\--
local MakeMainMenu = Tabs:MakeScrollingMenu(false, MainTab)
local _LeftBoxMainMenu = Tabs:MakeLeftBox(MakeMainMenu)
local _RightBoxManMenu = Tabs:MakeRightBox(MakeMainMenu)

local MakeVisualMenu = Tabs:MakeFrameMenu(false, VisualTab)
local _LeftBoxVisual = Tabs:MakeLeftBox(MakeVisualMenu)
local _RightBoxVisual = Tabs:MakeRightBox(MakeVisualMenu)

--// WORLD \\--
local Fullbright = Buttons:MakeDefaultButton(MakeWorldMenu, "Fullbright", "Fullbright", function()
  local Folder
  if functions.Fullbright then
    if #light:GetChildren() ~= 0 then
      Folder = Instance.new("Folder")
      Folder.Parent = rp
      Folder.Name = "Index"
      for _, a in pairs(light:GetChildren()) do
        a.Parent = Folder
      end
    end
    funcindex.Fullbright.oldClockTime = light.ClockTime
    light.ClockTime = 14
    funcindex.Fullbright.oldBrightness = light.Brightness
    light.Brightness = 4
    light.ExposureCompensation = .7
  else
    Folder = rp:FindFirstChild("Index")

    if Folder ~= nil then
      for _, a in pairs(Folder:GetChildren()) do
        a.Parent = light
      end
      Folder:Destroy()
      Folder = nil
    end
    light.ClockTime = funcindex.Fullbright.oldClockTime
    funcindex.Fullbright.oldClockTime = nil
    light.Brightness = funcindex.Fullbright.oldBrightness
    funcindex.Fullbright.oldBrightness = nil
    light.ExposureCompensation = 0
  end
  light:GetPropertyChangedSignal("ClockTime"):Connect(function()
    if functions.Fullbright then
      light.ClockTime = 14
    end
  end)
  light:GetPropertyChangedSignal("Brightness"):Connect(function()
    if functions.Fullbright then
      light.Brightness = 4
    end
  end)
end)

local AutoOpenDoors = Buttons:MakeDefaultButton(MakeWorldMenu, "Auto open doors", "AutoOpenDoors", function()
  if functions.AutoOpenDoors then
    RUNS.AutoOpenDoors = run.RenderStepped:Connect(function()
      local function GetDoor()
        local mapFolder = workspace:FindFirstChild("Map")
        if not mapFolder then return nil end
        local folderDoors = mapFolder:FindFirstChild("Doors")
        if not folderDoors then return nil end

        local closestDoor, dist = nil, 15
        for _, door in pairs(folderDoors:GetChildren()) do
          local doorBase = door:FindFirstChild("DoorBase")
          if doorBase and me.Character:FindFirstChild("HumanoidRootPart") then
            local distance = (me.Character.HumanoidRootPart.Position - doorBase.Position).Magnitude
            if distance < dist then
              dist = distance
              closestDoor = door
            end
          end
        end
        return closestDoor
      end

      local door = GetDoor()
      if door then
        local values = door:FindFirstChild("Values")
        local events = door:FindFirstChild("Events")
        if values and events then
          local locked = values:FindFirstChild("Locked")
          local openValue = values:FindFirstChild("Open")
          local toggleEvent = events:FindFirstChild("Toggle")
          if locked and openValue and toggleEvent then
            if locked.Value == true then
              toggleEvent:FireServer("Unlock", door.Lock)
            elseif locked.Value == false and openValue.Value == false then
              local knob1 = door:FindFirstChild("Knob1")
              local knob2 = door:FindFirstChild("Knob2")
              if knob1 and knob2 then
                local knob1pos = (me.Character.HumanoidRootPart.Position - knob1.Position).Magnitude
                local knob2pos = (me.Character.HumanoidRootPart.Position - knob2.Position).Magnitude
                local chosenKnob = (knob1pos < knob2pos) and knob1 or knob2
                toggleEvent:FireServer("Open", chosenKnob)
              end
            end
          end
        end
      end
    end)
  else
    if RUNS.AutoOpenDoors then
      RUNS.AutoOpenDoors:Disconnect()
      RUNS.AutoOpenDoors = nil
    end
  end
end)

local NoBarriers = Buttons:MakeDefaultButton(MakeWorldMenu, "No barriers", "NoBarriers", function()
  for _, a in pairs(workspace.Filter.Parts["F_Parts"]:GetDescendants()) do
    if a:IsA("Part") or a:IsA("MeshPart") then
      a.CanTouch = not a.CanTouch
    end
  end
end)

local NoGrinder = Buttons:MakeDefaultButton(MakeWorldMenu, "Anti grinder", "NoGrinder", function()
  for _, a in pairs(workspace.Map.Parts.Grinders:GetDescendants()) do
    if a:IsA("Part") or a:IsA("MeshPart") then
      a.CanTouch = not a.CanTouch
    end
  end
  for _, a in pairs(workspace.Map.Parts.M_Parts:GetDescendants()) do
    if a:IsA("Part") and a.Name == "FirePart" then
      a.CanTouch = not a.CanTouch
    end
  end
end)

local FastPickup = Buttons:MakeDefaultButton(MakeWorldMenu, "Fast pickup", "FastPickup", function()
  if functions.FastPickup then
    game.DescendantAdded:Connect(function(obj)
      if obj:IsA("ProximityPrompt") then
        obj.HoldDuration = 0
        obj:GetPropertyChangedSignal("HoldDuration"):Connect(function()
          if functions.FastPickup then
            obj.HoldDuration = 0
          end
        end)
      end
    end)
  end
end)

local AutoPickupScraps = Buttons:MakeDefaultButton(MakeWorldMenu, "Auto pickup scraps", "AutoPickupScraps", function()
  local remote = rp.Events.PIC_PU
  local scrapsfolder = workspace.Filter.SpawnedPiles
  local canPickup = true
  local startTick = tick()

  if functions.AutoPickupScraps then
    RUNS.AutopickupScraps = run.RenderStepped:Connect(function()
      local function GetClosestScrap()
        local maxdist = 15
        local closest = nil

        for _, a in pairs(scrapsfolder:GetChildren()) do
          if a and (a.Name == "S1" or a.Name == "S2") then
            if me.Character and me.Character.HumanoidRootPart then
              local getdist = (me.Character.HumanoidRootPart.Position - a.MeshPart.Position).Magnitude
              if getdist < maxdist then
                maxdist = getdist
                closest = a
              end
            end
          end
        end
        maxdist = 15
        return closest
      end

      local getscrap = GetClosestScrap()
      if getscrap then
        if canPickup then
          remote:FireServer(string.reverse(getscrap:GetAttribute("jzu")))
          canPickup = false
        end
      end
      if canPickup == false and tick() - startTick >= 4.5 then
        canPickup = true
        startTick = tick()
      end
    end)
  else
    if RUNS.AutopickupScraps then
      RUNS.AutopickupScraps:Disconnect()
      RUNS.AutopickupScraps = nil
    end
  end
end)

local AutoPickupTools = Buttons:MakeDefaultButton(MakeWorldMenu, "Auto pickup tools", "AutoPickupTools", function()
  local remote = game:GetService("ReplicatedStorage").Events.PIC_TLO
  local toolsfolder = workspace.Filter.SpawnedTools
  local canPickup = true
  local startTick = tick()

  if functions.AutoPickupTools then
    RUNS.AutopickupTools = run.RenderStepped:Connect(function()
      local function GetClosestTool()
        local maxdist = 15
        local closest = nil

        for _, a in pairs(toolsfolder:GetChildren()) do
          if a and me.Character and me.Character.HumanoidRootPart then
            local handle = a:FindFirstChild("Handle") or a:FindFirstChild("WeaponHandle")
            if handle and (handle:IsA("Part") or handle:IsA("MeshPart")) then
              if me.Character and me.Character:FindFirstChild("HumanoidRootPart") then
                local getdist = (me.Character.HumanoidRootPart.Position - handle.Position).Magnitude
                if getdist < maxdist then
                  maxdist = getdist
                  closest = a
                end
              end
            end
          end
        end
        maxdist = 15
        return closest
      end

      local tool = GetClosestTool()
      if tool then
        local Handle = tool:FindFirstChild("Handle") or tool:FindFirstChild("WeaponHandle")
        if Handle then
          if canPickup then
            remote:FireServer(Handle)
            canPickup = false
          end
        end
      end
      if canPickup == false and tick() - startTick >= 1.5 then
        canPickup = true
        startTick = tick()
      end
    end)
  else
    if RUNS.AutopickupTools then
      RUNS.AutopickupTools:Disconnect()
      RUNS.AutopickupTools = nil
    end
  end
end)

local AutoPickupCrates = Buttons:MakeDefaultButton(MakeWorldMenu, "Auto pickup crates", "AutoPickupTools", function()
  -- later
end)
local AutoPickupMoney = Buttons:MakeDefaultButton(MakeWorldMenu, "Auto pickup money", "AutoPickupMoney", function()
  local remote = rp.Events:FindFirstChild("CZDPZUS")
  local moneyfolder = workspace.Filter.SpawnedBread
  local canPickup = true
  local startTick = tick()

  if functions.AutoPickupMoney then
    RUNS.AutopickupMoney = run.RenderStepped:Connect(function()

      local function GetMoney()
        local maxdist = 15
        local closest = nil

        for _, a in pairs(moneyfolder:GetChildren()) do
          if a and me.Character and me.Character.HumanoidRootPart then
            local getdist = (me.Character.HumanoidRootPart.Position - a.Position).Magnitude
            if getdist < maxdist then
              maxdist = getdist
              closest = a
            end
          end
        end
        maxdist = 15
        return closest
      end

      local foundmoney = GetMoney()
      if foundmoney then
        if canPickup then
          remote:FireServer(foundmoney)
          canPickup = false
        end
      end
      if canPickup == false and tick() - startTick >= 1 then
        canPickup = true
        startTick = tick()
      end
    end)
  else
    if RUNS.AutopickupMoney then
      RUNS.AutopickupMoney:Disconnect()
      RUNS.AutopickupMoney = nil
    end
  end
end)

--// PLAYER \\--
local MakeFovSlider = Frames:MakeSlider(MakePlayerMenu, "FOV", camera.FieldOfView, 70, 120, function(val)
  if RUNS.cameraFOV ~= nil then
    RUNS.cameraFOV:Disconnect()
    RUNS.cameraFOV = nil
  end
  RUNS.cameraFOV = run.RenderStepped:Connect(function()
    camera.FieldOfView = val
  end)
end)
local MakeCameraDistanceSlider = Frames:MakeSlider(MakePlayerMenu, "Camera distance", me.CameraMaxZoomDistance, 10, 500, function(val)
  me.CameraMaxZoomDistance = val
end)
--local MakeSpeedSlider = Frames:MakeSlider(MakePlayerMenu, "Speed")
local MakeJumppowerSlider = Frames:MakeSlider(MakePlayerMenu, "Jump", 7.1, 7.1, 25, function(val)
  if RUNS.JumpHeight then
    RUNS.JumpHeight:Disconnect()
    RUNS.JumpHeight = nil
  end
  RUNS.JumpHeight = run.RenderStepped:Connect(function()
    if me.Character:FindFirstChild("Humanoid") then
      me.Character:FindFirstChild("Humanoid").UseJumpPower = false
      me.Character:FindFirstChild("Humanoid").JumpHeight = val
    end
  end)
end)
local MakeGravitySlider = Frames:MakeSlider(MakePlayerMenu, "Gravity", workspace.Gravity, workspace.Gravity, 75, function(val)
  workspace.Gravity = val
end)
local MakeInfstaminaButton = Buttons:MakeDefaultButton(MakePlayerMenu, "Inf stamina", "Infstamina", function()
  if functions.Infstamina then
    while functions.Infstamina do
      if Methods.Infstamina == "Getgc" then
        local stamina = {}
        function get()
          for index, value in pairs(getgc(true)) do
            if type(value) == "table" and rawget(value, "S") then
              stamina[#stamina + 1] = value
            end
          end
        end
        local ss, nn = pcall(function()
          get()
        end)
        if ss then
          for _, a in pairs(stamina) do
            a.S = 100
          end
        end
      elseif Methods.Infstamina == "low exploit" then
        if me.Character then
          local hum = me.Character:FindFirstChild("Humanoid")
          if hum and not hum:GetAttribute("ZSPRN_M") then
            hum:SetAttribute("ZSPRN_M", true)
          end
        end
        me.CharacterAdded:Connect(function(char)
          if functions.Infstamina then
            if char and char:WaitForChild("Humanoid") then
              local hum = char:FindFirstChild("Humanoid")
              if hum and not hum:GetAttribute("ZSPRN_M") then
                hum:SetAttribute("ZSPRN_M", true)
              end
            end
          end
        end)
      end
      run.RenderStepped:Wait()
    end
  else
    if me.Character then
      local hum = me.Character:FindFirstChild("Humanoid")
      if hum then
        local check = hum:GetAttribute("ZSPRN_M")
        if check then
          hum:SetAttribute("ZSPRN_M", nil)
        end
      end
    end
  end
end)
local MakeInfstaminaMethodSelector = Frames:MakeSelectTab(MakePlayerMenu, Methods.Infstamina, {"Getgc", "low exploit"}, "Infstamina")
local MakeNofalldamegButton = Buttons:MakeDefaultButton(MakePlayerMenu, "No fall damage", "Nofalldamage", function()
  if functions.Nofalldamage then
    if me.Character then
      local ff = Instance.new("ForceField")
      ff.Parent = me.Character
      ff.Visible = false
    end
    me.CharacterAdded:Connect(function(char)
      if functions.Nofalldamage and char and char:WaitForChild("HumanoidRootPart") and char:WaitForChild("Humanoid") then
        local ff = Instance.new("ForceField")
        ff.Parent = char
        ff.Visible = false
      end
    end)
  else
    if me.Character then
      for _, a in pairs(me.Character:GetChildren()) do
        if a:IsA("ForceField") and a.Visible == false then
          a:Destroy()
        end
      end
    end
  end
end)
local MakeNoclipButton = Buttons:MakeDefaultButton(MakePlayerMenu, "Noclip", "Noclip", "Noclip", function()
  if functions.Noclip then
    local function LoopNoclip()
      local char = me.Character
      if char then
        for _, a in pairs(char:GetDescendants()) do
          if a:IsA("BasePart") and a.CanCollide == true then
            a.CanCollide = false
          end
        end
      end
    end

    RUNS.Noclip = run.RenderStepped:Connect(LoopNoclip)
  else
    if RUNS.Noclip then
      RUNS.Noclip:Disconnect()
      RUNS.Noclip = nil
    end
  end
end)
local MakeFakeDownButton = Buttons:MakeDefaultButton(MakePlayerMenu, "Fake down", "FakeDown", "FakeDown", function()
  if functions.FakeDown then
    local getvalue = CharStats(me).Downed
    getvalue.Value = true
    getvalue:GetPropertyChangedSignal("Value"):Connect(function()
      if functions.FakeDown then
        getvalue.Value = true
      end
    end)
  else
    CharStats(me).Downed.Value = false
  end
end)
local MakeStopneckmove = Buttons:MakeDefaultButton(MakePlayerMenu, "Stop neck move", "Stopneckmove", function()
  if functions.Stopneckmove then
    if me.Character then
      me.Character:SetAttribute("NoNeckMovement", true)
    end
    me.CharacterAdded:Connect(function(char)
      if char and char:FindFirstChild("Humanoid") then
        if functions.Stopneckmove then
          char:SetAttribute("NoNeckMovement", true)
        end
      else
        repeat wait() until char and char:FindFirstChild("Humanoid")
        if functions.Stopneckmove then
          char:SetAttribute("NoNeckMovement", true)
        end
      end
    end)
  else
    if me.Character then
      local get = me.Character:GetAttribute("NoNeckMovement")
      if get then
        me.Character:SetAttribute("NoNeckMovement", nil)
      end
    end
  end
end)
local MakeUnbreaklimbs = Buttons:MakeDefaultButton(MakePlayerMenu, "Unbreak limbs", "Unbreaklimbs", function()
  local limbsfolder = CharStats(me).HealthValues
  for _, a in pairs(limbsfolder:GetChildren()) do
    for _, i in pairs(a:GetChildren()) do
      if i and i.Name == "Broken" then
        if functions.Unbreaklimbs then
          i.Value = false
          i:GetPropertyChangedSignal("Value"):Connect(function()
            if functions.Unbreaklimbs then
              i.Value = false
            end
          end)
        end
      end
    end
  end
  limbsfolder.ChildAdded:Connect(function()
    for _, a in pairs(limbsfolder:GetChildren()) do
      for _, i in pairs(a:GetChildren()) do
        if i and i.Name == "Broken" then
          if functions.Unbreaklimbs then
            i.Value = false
            i:GetPropertyChangedSignal("Value"):Connect(function()
              if functions.Unbreaklimbs then
                i.Value = false
              end
            end)
          end
        end
      end
    end
  end)
end)

--// MAIN \\--
local MakeSilentaimSection = Frames:MakeSection(_LeftBoxMainMenu)
local SilentAim = Buttons:MakeSectionDefaultButton(MakeSilentaimSection, "Silent aim", "SilentAim", function()
  if functions.SilentAim then
    cockie.SilentAimCircle = Drawing.new("Circle")
    cockie.SilentAimCircle.Color = Color3.new(1, 1, 1)
    cockie.SilentAimCircle.Thickness = 2
    cockie.SilentAimCircle.NumSides = 50
    cockie.SilentAimCircle.Radius = SectionSettings.SilentAim.DrawSize
    cockie.SilentAimCircle.Filled = false
    cockie.SilentAimCircle.Visible = true

    cockie.SilentAimCircle.Position = Vector2.new(camera.ViewportSize.X/2, camera.ViewportSize.Y/2)

    local target = nil

    local function GetClosest()
      target = nil
      local shortest = SectionSettings.SilentAim.DrawSize
      for _, a in pairs(plrs:GetPlayers()) do
        if a ~= me and a.Character then

          if SectionSettings.SilentAim.CheckDowned and CharStats(a).Downed.Value == true then
            continue
          end

          if SectionSettings.SilentAim.CheckTeam and a.Team == me.Team then
            continue
          end

          if SectionSettings.SilentAim.CheckWhiteList and table.find(WhiteList, a) then
            continue
          end

          local hrp = a.Character:FindFirstChild("HumanoidRootPart")
          if hrp then
            local screenpos, onScreen = camera:WorldToViewportPoint(hrp.Position)
            if onScreen then

              --[[if SectionSettings.SilentAim.CheckWall then
                local function Check()
                  local ignore = {camera, me.Character, a.Character}
                  if a.Parent ~= workspace then
                    table.insert(ignore, a.Parent)
                  end

                  local checkpart = a.Character:FindFirstChild("HumanoidRootPart")
                  if not checkpart then return math.huge end
                  return #camera:GetPartsObscuringTarget({checkpart.Position}, ignore)
                end
                local value = Check()
                if value > 0 then
                  continue
                end
              end]]
              local dist = (Vector2.new(camera.ViewportSize.X/2, camera.ViewportSize.Y/2) - Vector2.new(screenpos.X, screenpos.Y)).Magnitude
              if dist < shortest then
                target = a
              end
            end
          end
        end
      end
    end

    run.RenderStepped:Connect(GetClosest)

    local VisualizeEvent = game:GetService("ReplicatedStorage").Events2.Visualize
    local DamageEvent = game:GetService("ReplicatedStorage").Events["ZFKLF__H"]

    VisualizeEvent.Event:Connect(function(_, ShotCode, _, Gun, _, StartPos, BulletsPerShot)
      if not functions.SilentAim then return end
      if not Gun or not target or not target.Character or not target.Character:FindFirstChild("Humanoid") or target.Character:FindFirstChild("Humanoid").Health == 0 then return end
      if not me.Character or not me.Character:FindFirstChildOfClass("Tool") then return end

      local parts = SectionSettings.SilentAim.TargetParts[math.random(1, #SectionSettings.SilentAim.TargetParts)] or SectionSettings.SilentAim.TargetParts[1] or "Head"
      local targetPart = target.Character:FindFirstChild(parts)
      if not targetPart then return end

      local partPos = targetPart.Position
      local Bullets = {}
      for i = 1, math.clamp(#BulletsPerShot, 1, 100) do
        table.insert(Bullets, CFrame.new(StartPos, partPos).LookVector)
      end
      task.wait(0.005)
      for i, dir in pairs(Bullets) do
        DamageEvent:FireServer("🧈", Gun, ShotCode, i, targetPart, partPos, dir)
      end

      if Gun:FindFirstChild("Hitmarker") then
        Gun.Hitmarker:Fire(targetPart)
      end
    end)
  else
    if cockie.SilentAimCircle then
      cockie.SilentAimCircle:Remove()
      cockie.SilentAimCircle = nil
    end
  end
end)
--local MakeSilentAimDrawCircle = Buttons:MakeSectionCheckboxButton(MakeSilentaimSection, "Draw circle", "SilentAim", "Draw")
local MakeSilentAimDrawSizeSlider = Frames:MakeSectionSlider(MakeSilentaimSection, "Size", SectionSettings.SilentAim.DrawSize, 20, 500, function(val)
  SectionSettings.SilentAim.DrawSize = math.floor(val)
  if cockie.SilentAimCircle then
    cockie.SilentAimCircle.Radius = SectionSettings.SilentAim.DrawSize
  end
end)
--local MakeSilentColorWheelCircle = Buttons:MakeColorWheelSection(MakeSilentAimDrawCircle)
local MakeSilentAimTargetPart = Buttons:MakeSectionPressButton(MakeSilentaimSection, "Target part", function()
  if cockie.SilentAim_body then
    cockie.SilentAim_body:Destroy()
    cockie.SilentAim_body = nil
  else
    cockie.SilentAim_body = Frames:MakeBodySelector(SectionSettings.SilentAim.TargetParts)
  end
end)
local MakeSilentAimCheckDowned = Buttons:MakeSectionCheckboxButton(MakeSilentaimSection, "Check downed", "SilentAim", "CheckDowned")
--local MakeSilentAimCheckwall = Buttons:MakeSectionCheckboxButton(MakeSilentaimSection, "Check wall", "SilentAim", "CheckWall")
local MakeSilentAimCheckteam = Buttons:MakeSectionCheckboxButton(MakeSilentaimSection, "Check team", "SilentAim", "CheckTeam")
--local MakeSilentAimCheckWhiteList = Buttons:MakeSectionCheckboxButton(MakeSilentaimSection, "Check white list", "SilentAim", "CheckWhiteList")

local MakeAimbotSection = Frames:MakeSection(_RightBoxManMenu)
local Aimbot = Buttons:MakeSectionDefaultButton(MakeAimbotSection, "Aim bot", "AimBot", function()
  if functions.AimBot == true then
    cockie.aimbot_button = Instance.new("TextButton")
    cockie.aimbot_button.Parent = GUI
    cockie.aimbot_button.Name = "Aim"
    cockie.aimbot_button.BackgroundColor3 = Color3.new(0, 0, 0)
    cockie.aimbot_button.Position = UDim2.new(0.689, 0, 0.521, 0)
    cockie.aimbot_button.Size = UDim2.new(0, 40, 0, 40)
    cockie.aimbot_button.TextSize = 10
    cockie.aimbot_button.TextColor3 = Color3.new(1, 1, 1)
    cockie.aimbot_button.Text = "Aim"
    cockie.aimbot_button.Visible = true

    local uicaimbotbutton = Instance.new("UICorner")
    uicaimbotbutton.Parent = cockie.aimbot_button
    uicaimbotbutton.CornerRadius = UDim.new(8, 8)

    local uisaimbotbutton = Instance.new("UIStroke")
    uisaimbotbutton.Parent = cockie.aimbot_button
    uisaimbotbutton.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    uisaimbotbutton.Color = Color3.new(1, 1, 1)
    uisaimbotbutton.LineJoinMode = Enum.LineJoinMode.Round
    uisaimbotbutton.Thickness = 1

    local UIAaimbotbutton = Instance.new("UIAspectRatioConstraint")
    UIAaimbotbutton.Parent = cockie.aimbot_button

    local target = nil
    local pressed = false
    local aimtarget
    local canusing = false
    local FirstPerson = true
    local predict = 15

    local part
    local randpart = nil
    local LastTick = tick()

    cockie.AimBotCircle = Drawing.new("Circle")
    cockie.AimBotCircle.Color = Color3.new(1, 1, 1)
    cockie.AimBotCircle.Thickness = 2
    cockie.AimBotCircle.NumSides = 50
    cockie.AimBotCircle.Radius = SectionSettings.Aimbot.DrawSize
    cockie.AimBotCircle.Filled = false
    cockie.AimBotCircle.Visible = true

    local centerScreen = Vector2.new(camera.ViewportSize.X/2, camera.ViewportSize.Y/2)
    cockie.AimBotCircle.Position = centerScreen

    local function getClosestTarget()
      local closest, closestDist = nil, SectionSettings.Aimbot.DrawSize
      for _, player in pairs(plrs:GetPlayers()) do
        if player ~= me and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then

          local count = #SectionSettings.Aimbot.TargetParts

          if count == 0 then
            part = "Head"
          elseif count == 1 then
            part = SectionSettings.Aimbot.TargetParts[count]
          elseif count > 1 then
            if tick() - LastTick >= .5 then
              local rand = math.random(1, count)
              randpart = SectionSettings.Aimbot.TargetParts[rand]
              LastTick = tick()
            end
            part = randpart or SectionSettings.Aimbot.TargetParts[1]
          end

          local pos, onScreen = camera:WorldToViewportPoint(player.Character:FindFirstChild(part).Position)
          if onScreen then
            if SectionSettings.Aimbot.CheckTeam and player.Team == me.Team then
              continue
            end
            if SectionSettings.Aimbot.CheckWhiteList and table.find(WhiteList, player) then
              continue
            end

            local centerScreen = Vector2.new(camera.ViewportSize.X/2, camera.ViewportSize.Y/2)
            local distance = (Vector2.new(pos.X, pos.Y) - centerScreen).Magnitude
            if distance < closestDist then
              closestDist = distance
              closest = player
            end
          end
        end
      end
      return closest
    end

    cockie.aimbot_button.MouseButton1Click:Connect(function()
      pressed = not pressed
      aimtarget = getClosestTarget() or nil
    end)

    run.RenderStepped:Connect(function()
      if FirstPerson then
        local magnitude = (camera.Focus.p - camera.CFrame.p).Magnitude
        canusing = magnitude <= 1.5
      end
      if functions.AimBot and pressed and aimtarget and aimtarget.Character then
        local head = aimtarget.Character:FindFirstChild(part)
        local humanoid = aimtarget.Character:FindFirstChild("Humanoid")
        if head and humanoid and humanoid.Health ~= 0 and canusing then
          local targetPosition = head.Position

          if SectionSettings.Aimbot.CheckDowned and CharStats(target).Downed.Value == true then
            return
          end

          if SectionSettings.Aimbot.Velocity then
            targetPosition = targetPosition + head.Velocity / predict
          end
          camera.CFrame = camera.CFrame:Lerp(CFrame.new(camera.CFrame.p, targetPosition), 0.9)
        end
      end
    end)

  else
    if cockie.AimBotCircle then 
      cockie.AimBotCircle:Remove() 
      cockie.AimBotCircle = nil
    end
    if cockie.aimbot_button then 
      cockie.aimbot_button:Destroy()
      cockie.aimbot_button = nil
    end
  end
end)
--local MakeAimbotDrawCircle = Buttons:MakeSectionCheckboxButton(MakeAimbotSection, "Draw circle", "Aimbot", "Draw")
local MakeAimbotDrawSizeSlider = Frames:MakeSectionSlider(MakeAimbotSection, "Size", SectionSettings.Aimbot.DrawSize, 20, 500, function(val)
  SectionSettings.Aimbot.DrawSize = math.floor(val)
  if cockie.AimBotCircle then
    cockie.AimBotCircle.Radius = SectionSettings.Aimbot.DrawSize
  end
end)
--local MakeAimbotColorWheelCircle = Buttons:MakeColorWheelSection(MakeAimbotDrawCircle)
local MakeAimbotTargetPart = Buttons:MakeSectionPressButton(MakeAimbotSection, "Target part", function()
  if cockie.Aimbot_body then
    cockie.Aimbot_body:Destroy()
    cockie.Aimbot_body = nil
  else
    cockie.Aimbot_body = Frames:MakeBodySelector(SectionSettings.Aimbot.TargetParts)
  end
end)
local MakeAimbotCheckDowned = Buttons:MakeSectionCheckboxButton(MakeAimbotSection, "Check downed", "Aimbot", "CheckDowned")
local MakeAimbotCheckWall = Buttons:MakeSectionCheckboxButton(MakeAimbotSection, "Check wall", "Aimbot", "CheckWall")
local MakeAimbotCheckteam = Buttons:MakeSectionCheckboxButton(MakeAimbotSection, "Check team", "Aimbot", "CheckTeam")
--local MakeAimbotCheckWhiteList = Buttons:MakeSectionCheckboxButton(MakeAimbotSection, "Check white list", "Aimbot", "CheckWhiteList")
local MakeAimbotVelocity = Buttons:MakeSectionCheckboxButton(MakeAimbotSection, "Velocity", "Aimbot", "Velocity")
local MakeAimbotSmooth = Buttons:MakeSectionCheckboxButton(MakeAimbotSection, "Smooth", "Aimbot", "Smooth")
local MakeAimbotSmoothSize = Frames:MakeSectionSlider(MakeAimbotSection, "Size", SectionSettings.Aimbot.SmoothSize, 0.1, 1, function(val)
  SectionSettings.Aimbot.SmoothSize = val
end)

local MakeMeleeauraSection = Frames:MakeSection(_LeftBoxMainMenu)
local Meleeaura = Buttons:MakeSectionDefaultButton(MakeMeleeauraSection, "Melee aura", "Meleeaura", function()
  local remote1 = rp.Events["XMHH.2"]
  local remote2 = rp.Events["XMHH2.2"]

  local part
  local randpart = nil

  local LastTick = tick()
  local AttachTick = tick()

  local attach = false
  local attachcd = .1

  local AttachCD = {
    ["Fists"] = .05,
    ["Knuckledusters"] = .05,
    ["Nunchucks"] = 0.05,
    ["Shiv"] = .05,
    ["Bat"] = 1,
    ["Metal-Bat"] = 1,
    ["Chainsaw"] = 2.5,
    ["Balisong"] = .05,
    ["Rambo"] = .3,
    ["Shovel"] = 3,
    ["Sledgehammer"] = 2,
    ["Katana"] = .1,
    ["Wrench"] = .1,
    ["FireAxe"] = 2.6
  }

  local function Attack(target)
    if not (target and target:FindFirstChild("Head")) then return end

    local mychar = me.Character
    if not mychar then return end
    local TOOL = mychar:FindFirstChildOfClass("Tool")
    if not TOOL then return end
    local AnimFolder = TOOL:FindFirstChild("AnimsFolder")
    if not AnimFolder then return end
    local anim = AnimFolder:FindFirstChild("Slash1")
    if not anim then return end
    local load = me.Character:FindFirstChildOfClass("Humanoid"):FindFirstChild("Animator"):LoadAnimation(anim)

    if tick() - AttachTick >= attachcd then
      local result = remote1:InvokeServer("🍞", tick(), TOOL, "43TRFWX", "Normal", tick(), true)

      attachcd = AttachCD[TOOL.Name] or 1/2

      if SectionSettings.MeleeAura.ShowAnim then
        local load = me.Character:FindFirstChildOfClass("Humanoid"):FindFirstChild("Animator"):LoadAnimation(anim)
        load:Play()
        load:AdjustSpeed(1.3)
      end

      task.wait(0.3 + math.random() * 0.2)

      if TOOL then

        local Handle = TOOL:FindFirstChild("WeaponHandle") or TOOL:FindFirstChild("Handle") or me.Character:FindFirstChild("Right Arm")
        local arg2 = {
          "🍞",
          tick(),
          TOOL,
          "2389ZFX34",
          result,
          true,
          Handle,
          target:FindFirstChild(part),
          target,
          me.Character.HumanoidRootPart.Position,
          target:FindFirstChild(part).Position
        }
        if TOOL.Name == "Chainsaw" then
          for i = 1, 15 do
            remote2:FireServer(unpack(arg2)) 
          end
        else
          remote2:FireServer(unpack(arg2))
        end
        AttachTick = tick()
      else
        return
      end
    end
  end

  while functions.Meleeaura do
    local mychar = me.Character or me.CharacterAdded:Wait()
    if mychar then
      local myhrp = mychar:FindFirstChild("HumanoidRootPart")
      if myhrp then
        for _, a in ipairs(plrs:GetPlayers()) do
          if a ~= me then
            local char = a.Character
            if char then
              local hrp = char:FindFirstChild("HumanoidRootPart")
              if hrp then
                local distance = (myhrp.Position - hrp.Position).Magnitude
                if distance < SectionSettings.MeleeAura.Distance and a.Character:FindFirstChildOfClass("Humanoid").Health ~= 0 and not char:FindFirstChildOfClass("ForceField") then

                  if SectionSettings.MeleeAura.CheckWhiteList and table.find(WhiteList, a) then
                    continue
                  end

                  if SectionSettings.MeleeAura.CheckTeam and a.Team == me.Team then
                    continue
                  end

                  if SectionSettings.MeleeAura.CheckDowned and CharStats(a).Downed.Value == true then
                    continue
                  end

                  local count = #SectionSettings.MeleeAura.TargetParts

                  if count == 0 then
                    part = "Head"
                  elseif count == 1 then
                    part = SectionSettings.MeleeAura.TargetParts[#SectionSettings.MeleeAura.TargetParts]
                  elseif count > 1 then
                    if tick() - LastTick >= .2 then
                      local rand = math.random(1, count)
                      randpart = SectionSettings.MeleeAura.TargetParts[rand]
                      LastTick = tick()
                    end
                    part = randpart or SectionSettings.MeleeAura.TargetParts[1]
                  end

                  Attack(char)
                end
              end
            end
          end
        end
      end
    end
    run.Heartbeat:Wait()
  end
end)
local MakeMeleeAuraShowAnim = Buttons:MakeSectionCheckboxButton(MakeMeleeauraSection, "Show anim", "MeleeAura", "ShowAnim")
local MakeMeleeAuraTargetParts = Buttons:MakeSectionPressButton(MakeMeleeauraSection, "Target parts", function()
  if cockie.MeleeAura_body then
    cockie.MeleeAura_body:Destroy()
    cockie.MeleeAura_body = nil
  else
    cockie.MeleeAura_body = Frames:MakeBodySelector(SectionSettings.MeleeAura.TargetParts)
  end
end)
local MakeMeleeAuraCheckDowned = Buttons:MakeSectionCheckboxButton(MakeMeleeauraSection, "Check downed", "MeleeAura", "CheckDowned")
local MakeMeleeAuraCheckTeam = Buttons:MakeSectionCheckboxButton(MakeMeleeauraSection, "Check team", "MeleeAura", "CheckTeam")
--local MakeMeleeAuraCheckWhiteList = Buttons:MakeSectionCheckboxButton(MakeMeleeauraSection, "Check white list", "MeleeAura", "CheckWhiteList")

local MakeRagebotSection = Frames:MakeSection(_RightBoxManMenu)
local RageBot = Buttons:MakeSectionDefaultButton(MakeRagebotSection, "Rage bot", "RageBot", function()
  local function RandomString(length)
    local res = ""
    for i = 1, length do
      res = res .. string.char(math.random(97, 122))
    end
    return res
  end

  local function GetClosestEnemy()
    if not me.Character 
      or not me.Character:FindFirstChild("HumanoidRootPart") 
    then return nil end

    local closestEnemy = nil
    local shortestDistance = 100

    for _, player in pairs(plrs:GetPlayers()) do
      if player == me then continue end

      local character = player.Character
      local humanoid = character and character:FindFirstChildOfClass("Humanoid")
      local rootPart = character and character:FindFirstChild("HumanoidRootPart")

      if character 
        and rootPart 
        and humanoid 
        and humanoid.Health > 15 
        and not character:FindFirstChildOfClass("ForceField") 
      then
        if SectionSettings.RageBot.CheckWhiteList and table.find(WhiteList, player) then
          continue
        end

        local distance = (rootPart.Position - me.Character.HumanoidRootPart.Position).Magnitude
        if distance < shortestDistance then
          shortestDistance = distance
          closestEnemy = player
        end
      end
    end
    return closestEnemy
  end

  local function Shoot(target)
    if not target or not target.Character then return end

    local head = target.Character:FindFirstChild("Head")
    if not head then return end

    local tool = me.Character and me.Character:FindFirstChildOfClass("Tool")
    if not tool then return end

    local values = tool:FindFirstChild("Values")
    local hitMarker = tool:FindFirstChild("Hitmarker")
    if not values or not hitMarker then return end

    local ammo = values:FindFirstChild("SERVER_Ammo")
    local storedAmmo = values:FindFirstChild("SERVER_StoredAmmo")
    if not ammo or not storedAmmo then return end

    local hitPosition = head.Position
    local hitDirection = (hitPosition - camera.CFrame.Position).unit
    local randomKey = RandomString(30) ..0

    if tool.Name == "Beretta" or tool.Name == "TEC-9" then
      if ammo.Value > 0 then
        rp.Events.GNX_S:FireServer(
          tick(),
          randomKey,
          tool,
          "FDS9I83",
          camera.CFrame.Position,
          {hitDirection},
          false
        )

        task.delay(0.00001, function()
          rp.Events["ZFKLF__H"]:FireServer(
            "🧈",
            tool,
            randomKey,
            1,
            head,
            hitPosition,
            hitDirection
          )

          ammo.Value = math.max(ammo.Value - 1, 0)
          hitMarker:Fire(head)
          storedAmmo.Value = values:FindFirstChild("SERVER_StoredAmmo").Value
          rp.Events.GNX_R:FireServer(tick(), "KLWE89U0", tool)
        end)
      end
    end
  end

  local function RageBotLoop()
    while functions.RageBot do
      if me.Character and me.Character:FindFirstChildOfClass("Tool") then
        local target = GetClosestEnemy()
        if target then
          Shoot(target)
        end
      end
      run.RenderStepped:Wait()
    end
  end
  RageBotLoop()
end)
local MakeRagebotDownedCheck = Buttons:MakeSectionCheckboxButton(MakeRagebotSection, "Check downed", "RageBot", "CheckDowned")
--local MakeRagebotWhiteListCheck = Buttons:MakeSectionCheckboxButton(MakeRagebotSection, "Check white list", "RageBot", "CheckWhiteList")

--[[local MakeTrigerbotSection = Frames:MakeSection(_LeftBoxMainMenu)
local TrigerBot = Buttons:MakeSectionDefaultButton(MakeTrigerbotSection, "Triger bot", "TrigerBot", function()
  -- later
end)]]

--[[local MakeRocketControlSection = Frames:MakeSection(_RightBoxManMenu)
local RocketControl = Buttons:MakeSectionDefaultButton(MakeRocketControlSection, "Rocket control", "RocketControl", function()
  -- later
end)]]

local MakeInstantReloadButton = Buttons:MakeDefaultButton(_LeftBoxMainMenu, "Instant reload", "Instantreload", function()
  local gunR_remote = rp.Events.GNX_R
  if functions.Instantreload then
    local charme = me.Character
    if charme then
      local tool = charme:FindFirstChildOfClass("Tool")
      if tool and tool:FindFirstChild("IsGun") then
        local value = tool:FindFirstChild("Values"):FindFirstChild("SERVER_Ammo")
        local value2 = tool:FindFirstChild("Values"):FindFirstChild("SERVER_StoredAmmo")
        value2:GetPropertyChangedSignal("Value"):Connect(function()
          if functions.Instantreload then
            gunR_remote:FireServer(tick(), "KLWE89U0", tool);
          end
        end)
        if value2.Value ~= 0 then
          if functions.Instantreload then
            gunR_remote:FireServer(tick(), "KLWE89U0", tool);
          end
        end
        value:GetPropertyChangedSignal("Value"):Connect(function()
          if functions.Instantreload and value2.Value ~= 0 then
            gunR_remote:FireServer(tick(), "KLWE89U0", tool);
          end
        end)
      else
        charme.ChildAdded:Connect(function(obj)
          if obj:IsA("Tool") and obj:FindFirstChild("IsGun") then
            local value = obj:FindFirstChild("Values"):FindFirstChild("SERVER_Ammo")
            local value2 = obj:FindFirstChild("Values"):FindFirstChild("SERVER_StoredAmmo")
            value2:GetPropertyChangedSignal("Value"):Connect(function()
              if functions.Instantreload then
                gunR_remote:FireServer(tick(), "KLWE89U0", obj);
              end
            end)
            if value2.Value ~= 0 then
              if functions.Instantreload then
                gunR_remote:FireServer(tick(), "KLWE89U0", obj);
              end
            end
            value:GetPropertyChangedSignal("Value"):Connect(function()
              if functions.Instantreload and value2.Value ~= 0 then
                gunR_remote:FireServer(tick(), "KLWE89U0", obj);
              end
            end)
          end
        end)
      end
      me.CharacterAdded:Connect(function(charr)
        repeat wait() until charr and charr.Parent
        charr.ChildAdded:Connect(function(obj)
          if obj:IsA("Tool") and obj:FindFirstChild("IsGun") then
            local value = obj:FindFirstChild("Values"):FindFirstChild("SERVER_Ammo")
            local value2 = obj:FindFirstChild("Values"):FindFirstChild("SERVER_StoredAmmo")
            value2:GetPropertyChangedSignal("Value"):Connect(function()
              if functions.Instantreload then
                gunR_remote:FireServer(tick(), "KLWE89U0", obj);
              end
            end)
            if value2.Value ~= 0 then
              if functions.Instantreload then
                gunR_remote:FireServer(tick(), "KLWE89U0", obj);
              end
            end
            value:GetPropertyChangedSignal("Value"):Connect(function()
              if functions.Instantreload and value2.Value ~= 0 then
                gunR_remote:FireServer(tick(), "KLWE89U0", obj);
              end
            end)
          end
        end)
      end)
    end
  end
end)

--// VISUAL \\--
local MakeEspSection = Frames:MakeSection(_LeftBoxVisual)
local Esp = Buttons:MakeSectionDefaultButton(MakeEspSection, "ESP", "ESP", function()
  if functions.ESP then
    RUNS.ESP = run.Heartbeat:Connect(function()
      if SectionSettings.ESP.Highlight then
        local function Update()
          for _, a in pairs(plrs:GetPlayers()) do
            if a ~= me then
              local char = a.Character
              if char and not char:FindFirstChild("Highlight") then
                local hg = Instance.new("Highlight")
                hg.Parent = char
                hg.FillTransparency = 1
              end
            end
          end
        end
        Update()

        plrs.PlayerAdded:Connect(function(player)
          if functions.ESP then
            local char = player.Character or player.CharacterAdded:Wait()
            if char and SectionSettings.ESP.Highlight and not char:FindFirstChild("Highlight") then
              local hg = Instance.new("Highlight")
              hg.Parent = char
              hg.FillTransparency = 1
            end
          end
        end)
      else
        for _, a in pairs(plrs:GetPlayers()) do
          if a ~= me then
            local char = a.Character
            if char then
              local h = char:FindFirstChild("Highlight")
              if h then h:Destroy() end
            end
          end
        end
      end
    end)
  else
    if RUNS.ESP then
      RUNS.ESP:Disconnect()
      RUNS.ESP = nil
    end
    for _, a in pairs(plrs:GetPlayers()) do
      if a ~= me then
        local char = a.Character
        if char then
          local h = char:FindFirstChild("Highlight")
          if h then h:Destroy() end
        end
      end
    end
  end
end)
--local MakeESPName = Buttons:MakeSectionCheckboxButton(MakeEspSection, "Name", "ESP", "Name")
--local MakeESPBox = Buttons:MakeSectionCheckboxButton(MakeEspSection, "Box", "ESP", "Box")
local MakeESPHighlight = Buttons:MakeSectionCheckboxButton(MakeEspSection, "Highlight", "ESP", "Highlight")

local MakeArmsChams = Buttons:MakeDefaultButton(_RightBoxVisual, "Arms chams", "ArmsChams", function()
  local viewfolder = camera:WaitForChild("ViewModel")
  if functions.ArmsChams == true then
    viewfolder["Left Arm"].Material = Enum.Material.ForceField
    viewfolder["Right Arm"].Material = Enum.Material.ForceField
  else
    viewfolder["Left Arm"].Material = Enum.Material.Plastic
    viewfolder["Right Arm"].Material = Enum.Material.Plastic
  end
  me.CharacterAdded:Connect(function(char)
    repeat wait() until char and char.Parent
    local viewfolder = camera:WaitForChild("ViewModel")
    if functions.ArmsChams == true then
      viewfolder["Left Arm"].Material = Enum.Material.ForceField
      viewfolder["Right Arm"].Material = Enum.Material.ForceField
    else
      viewfolder["Left Arm"].Material = Enum.Material.Plastic
      viewfolder["Right Arm"].Material = Enum.Material.Plastic
    end
  end)
end)
--[[local MakeToolsChams = Buttons:MakeDefaultButton(_RightBoxVisual, "Tools chams", "ToolsChams", function()
  -- later
end)]]

dragging = false
dragInput = nil
dragStart = nil
startPos = nil

function UpdatePos(input)
  local delta = input.Position - dragStart
  local newPosition = UDim2.new(
    startPos.X.Scale,
    startPos.X.Offset + delta.X,
    startPos.Y.Scale,
    startPos.Y.Offset + delta.Y
  )

  local anim1 = tween:Create(Menu, TweenInfo.new(0.15), {Position = newPosition})
  anim1:Play()
end

dragg.InputBegan:Connect(function(input)
  if input.UserInputType == Enum.UserInputType.Touch then
    dragging = true
    dragStart = input.Position
    startPos = Menu.Position

    input.Changed:Connect(function()
      if input.UserInputState == Enum.UserInputState.End then
        dragging = false
      end
    end)
  end
end)

dragg.InputChanged:Connect(function(input)
  if input.UserInputType == Enum.UserInputType.MouseMovement or Enum.UserInputType.Touch then
    dragInput = input
  end
end)

input.InputChanged:Connect(function(input)
  if dragging and input == dragInput then
    UpdatePos(input)
  end
end)

OpenClose.MouseButton1Click:Connect(function()
  Menu.Visible = not Menu.Visible
end)
