if game:GetService("CoreGui"):FindFirstChild('RemoteDebugWindow',true) then
    game:GetService("CoreGui"):FindFirstChild('RemoteDebugWindow',true).Parent:Destroy()
end

math.randomseed(tick())

local charset = {}

for i = 48,  57 do table.insert(charset, string.char(i)) end
for i = 65,  90 do table.insert(charset, string.char(i)) end
for i = 97, 122 do table.insert(charset, string.char(i)) end

function RandomCharacters(length)
    return length > 0 and RandomCharacters(length - 1) .. charset[Random.new():NextInteger(1, #charset)] or ""
end

local SynLibrary, Dex = syn or {protect_gui = function() end}, game:GetObjects("rbxassetid://5475777257")[1] -- Beta version: "rbxassetid://5482100934" | I will constantly update beta version so it might break
pcall(SynLibrary.protect_gui, Dex)
Dex.Name = RandomCharacters(Random.new():NextInteger(5,20))
Dex.Parent = game:GetService("CoreGui")
    
local function Load(Obj, Url)
local function GiveOwnGlobals(Func, Script)
    local Fenv, RealFenv, FenvMt = {}, {script = Script}, setmetatable({},{__metatable = "The metatable is locked"})
    FenvMt.__index = function(a,b)
        return RealFenv[b] == nil and getfenv()[b] or RealFenv[b]
    end
    FenvMt.__newindex = function(a, b, c)
        if RealFenv[b] == nil then getfenv()[b] = c else RealFenv[b] = c end
    end
    setrawmetatable(Fenv, FenvMt)
    setfenv(Func, Fenv)
    return Func
end

local function LoadScripts(_, Script)
    if Script:IsA("Script") or Script:IsA("LocalScript") then
        spawn(function() GiveOwnGlobals(loadstring(gethiddenproperty(Script,"Source"), "=" .. Script:GetFullName()), Script)() end)
    end
    table.foreach(Script:GetChildren(), LoadScripts)
end

LoadScripts(nil, Obj)
end

Load(Dex)

--not made by me 