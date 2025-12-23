-- 手机版个人监控脚本 (LocalScript)
-- 放在 StarterPlayerScripts 中
local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")
local localPlayer = Players.LocalPlayer

print("📱 手机动作监控已启动 - 只监控你自己")

-- ========== 1. 监控触屏操作 ==========
UIS.TouchStarted:Connect(function(touch, gameProcessed)
    if not gameProcessed then
        print("[📱 触屏开始] 位置:", 
            math.floor(touch.Position.X), ",", 
            math.floor(touch.Position.Y))
    end
end)

UIS.TouchEnded:Connect(function(touch, gameProcessed)
    if not gameProcessed then
        print("[📱 触屏结束]")
    end
end)

-- ========== 2. 监控虚拟摇杆（如果有） ==========
UIS.TouchMoved:Connect(function(touch, gameProcessed)
    if not gameProcessed and touch.Delta.Magnitude > 10 then
        print("[📱 滑动] 距离:", math.floor(touch.Delta.Magnitude))
    end
end)

-- ========== 3. 监控手势 ==========
local lastTapTime = 0
UIS.Tap:Connect(function(tapPos)
    local currentTime = tick()
    if currentTime - lastTapTime < 0.3 then
        print("[📱 双击]")
    else
        print("[📱 单击]")
    end
    lastTapTime = currentTime
end)

-- ========== 4. 监控屏幕按钮点击 ==========
local function monitorScreenGuis()
    -- 监控所有 ScreenGui 中的按钮
    for _, gui in pairs(game:GetService("CoreGui"):GetChildren()) do
        if gui:IsA("ScreenGui") then
            for _, button in pairs(gui:GetDescendants()) do
                if button:IsA("TextButton") or button:IsA("ImageButton") then
                    button.MouseButton1Click:Connect(function()
                        print("[📱 点击按钮]", button.Name, "| 父级:", button.Parent.Name)
                    end)
                end
            end
        end
    end
end

-- ========== 5. 监控手机倾斜（陀螺仪） ==========
if UIS:GetLastInputType() == Enum.UserInputType.Gyro then
    UIS.Changed:Connect(function(property)
        if property == "Rotation" then
            local rotation = UIS.Rotation
            print("[📱 手机旋转]", 
                "X:", math.floor(rotation.X), 
                "Y:", math.floor(rotation.Y),
                "Z:", math.floor(rotation.Z))
        end
    end)
end

-- ========== 6. 监控自己的角色动作 ==========
local function monitorMyCharacter()
    if localPlayer.Character then
        local humanoid = localPlayer.Character:FindFirstChild("Humanoid")
        if humanoid then
            -- 监控跳跃
            humanoid.Jumping:Connect(function(active)
                if active then
                    print("[🤸 我跳了起来]")
                end
            end)
            
            -- 监控死亡
            humanoid.Died:Connect(function()
                print("[💀 我死了]")
            end)
        end
    end
end

localPlayer.CharacterAdded:Connect(monitorMyCharacter)
if localPlayer.Character then
    monitorMyCharacter()
end

-- ========== 7. 监控我的背包物品使用 ==========
local function monitorBackpack()
    local backpack = localPlayer:FindFirstChild("Backpack")
    if backpack then
        for _, tool in ipairs(backpack:GetChildren()) do
            if tool:IsA("Tool") then
                tool.Activated:Connect(function()
                    print("[🛠️ 我使用了]", tool.Name)
                end)
            end
        end
    end
end

localPlayer.Backpack.ChildAdded:Connect(function(child)
    if child:IsA("Tool") then
        child.Activated:Connect(function()
            print("[🛠️ 我使用了新工具]", child.Name)
        end)
    end
end)

-- ========== 8. 简单动作记录器 ==========
local myActionsLog = {}
local MAX_LOG = 20

local function addActionLog(actionType, details)
    table.insert(myActionsLog, {
        time = os.date("%H:%M:%S"),
        type = actionType,
        details = details
    })
    
    if #myActionsLog > MAX_LOG then
        table.remove(myActionsLog, 1)
    end
    
    print("📝 " .. actionType .. ": " .. details)
end

-- ========== 9. 手势控制：长按显示日志 ==========
local longPressTime = 0
local isLongPressing = false

UIS.TouchStarted:Connect(function()
    longPressTime = tick()
    isLongPressing = true
    
    -- 1.5秒后触发长按
    task.spawn(function()
        task.wait(1.5)
        if isLongPressing then
            print("\n📊 === 我的动作记录 ===")
            for i, action in ipairs(myActionsLog) do
                print(string.format("%d. [%s] %s - %s", 
                    i, action.time, action.type, action.details))
            end
            print("总计: " .. #myActionsLog .. " 个动作")
            print("=====================\n")
            addActionLog("长按", "查看动作记录")
        end
    end)
end)

UIS.TouchEnded:Connect(function()
    isLongPressing = false
    local duration = tick() - longPressTime
    if duration < 1.5 and duration > 0.1 then
        addActionLog("点击", "时长 " .. math.floor(duration*1000) .. "ms")
    end
end)

-- ========== 10. 监控是否在走路/跑动 ==========
local RunService = game:GetService("RunService")
local lastPosition = Vector3.new(0,0,0)

RunService.Heartbeat:Connect(function()
    if localPlayer.Character and localPlayer.Character:FindFirstChild("HumanoidRootPart") then
        local rootPart = localPlayer.Char