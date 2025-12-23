-- Universal Listener Core
print("🎮 通用监听器启动")

-- 监听所有远程事件
for _, obj in pairs(game:GetDescendants()) do
    if obj:IsA("RemoteEvent") then
        local old = obj.FireServer
        obj.FireServer = function(self, ...)
            print("📡 事件: " .. obj.Name)
            return old(self, ...)
        end
    end
end

-- 监听玩家数据
local player = game.Players.LocalPlayer
if player then
    for _, child in pairs(player:GetDescendants()) do
        if child:IsA("NumberValue") then
            child:GetPropertyChangedSignal("Value"):Connect(function()
                print("💰 " .. child.Name .. ": " .. child.Value)
            end)
        end
    end
end

print("✅ 监听中...")
while true do wait(5) end
