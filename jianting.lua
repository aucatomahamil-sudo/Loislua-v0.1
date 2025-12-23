-- jianting.lua (修正版)
print("监听器启动 - 私人服务器专用")

-- 监听所有RemoteEvent
for _, obj in pairs(game:GetDescendants()) do
    if obj:IsA("RemoteEvent") then
        local oldFire = obj.FireServer  -- 保存原函数
        obj.FireServer = function(self, ...)
            print("[事件] " .. obj.Name)
            return oldFire(self, ...)  -- 调用原函数
        end
    end
end

-- 监听玩家数值变化
local player = game.Players.LocalPlayer
if player then
    for _, child in pairs(player:GetDescendants()) do
        if child:IsA("NumberValue") then
            child:GetPropertyChangedSignal("Value"):Connect(function()
                print("[数值] " .. child.Name .. " = " .. child.Value)
            end)
        end
    end
end

-- 保持运行
while true do
    wait(2)
end