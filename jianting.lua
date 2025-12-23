-- jianting.lua - 最小监听器
print("Listener Started")

-- 监听远程事件
for _, obj in pairs(game:GetDescendants()) do
    if obj:IsA("RemoteEvent") then
        local oldFire = obj.FireServer
        obj.FireServer = function(self, ...)
            print("EVENT: " .. obj.Name)
            return oldFire(self, ...)
        end
    elseif obj:IsA("RemoteFunction") then
        local oldInvoke = obj.InvokeServer
        obj.InvokeServer = function(self, ...)
            print("FUNCTION: " .. obj.Name)
            return oldInvoke(self, ...)
        end
    end
end

-- 监听玩家数值
local player = game.Players.LocalPlayer
if player then
    for _, child in pairs(player:GetDescendants()) do
        if child:IsA("NumberValue") then
            child:GetPropertyChangedSignal("Value"):Connect(function()
                print("VALUE: " .. child.Name .. " = " .. child.Value)
            end)
        end
    end
end

-- 保持运行
while true do
    wait(5)
end