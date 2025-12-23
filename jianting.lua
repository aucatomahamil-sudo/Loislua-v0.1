-- jianting.lua
print("Listener ON")

for _, obj in pairs(game:GetDescendants()) do
    if obj:IsA("RemoteEvent") then
        local old = obj.FireServer
        obj.FireServer = function(self, ...)
            print("EVENT: " .. obj.Name)
            return old(self, ...)
        end
    end
end

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

while true do
    wait(2)
end