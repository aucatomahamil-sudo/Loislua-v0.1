-- Universal Listener Core
print("Universal Listener Started")

for _, obj in pairs(game:GetDescendants()) do
    if obj:IsA("RemoteEvent") then
        local oldFire = obj.FireServer
        obj.FireServer = function(self, ...)
            print("Event: " .. obj.Name)
            return oldFire(self, ...)
        end
    end
end

local player = game.Players.LocalPlayer
if player then
    for _, child in pairs(player:GetDescendants()) do
        if child:IsA("NumberValue") then
            child:GetPropertyChangedSignal("Value"):Connect(function()
                print("Value: " .. child.Name .. " = " .. child.Value)
            end)
        end
    end
end

print("Listening...")
while true do
    wait(5)
end
