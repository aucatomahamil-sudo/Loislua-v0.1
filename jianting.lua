-- listener.lua
print("Listener ON")

for i, obj in pairs(game:GetDescendants()) do
    if obj.ClassName == "RemoteEvent" then
        local old = obj.FireServer
        obj.FireServer = function(...)
            print("EVENT " .. obj.Name)
            return old(...)
        end
    end
end

local p = game.Players.LocalPlayer
if p then
    for i, child in pairs(p:GetDescendants()) do
        if child.ClassName == "NumberValue" then
            child.Changed:Connect(function()
                print("VAL " .. child.Name .. " " .. child.Value)
            end)
        end
    end
end

while true do
    wait(1)
end