function getLaptop()
    for i,v in pairs(game:GetService("Workspace").Studios[game:GetService("Players").LocalPlayer.Name .. "'s Studio"].Items:GetChildren()) do
        local item = game:GetService("ReplicatedStorage").Items:FindFirstChild(v.Name)
        if item ~= nil then
            local id = item:FindFirstChild("ID")
            local keyboard = item:FindFirstChild("Keyboard")
            if item ~= nil and keyboard ~= nil then
                if id.Value == 1 then
                    return v.Name
                end
            end
        end
    end
end

getgenv().autoSdCard = false
while true do
    if getgenv().autoSdCard then
        local Target = game:GetService("ReplicatedStorage").fileMade
        Target:FireServer()
    else
        local userdata_1 = game:GetService("Workspace").Studios[game:GetService("Players").LocalPlayer.Name .. "'s Studio"].Items[getLaptop()]
        local Target = game:GetService("ReplicatedStorage").singleVideo
        Target:FireServer(userdata_1)
    end
    wait()
end