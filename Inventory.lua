local Inventory = {tag = "inventory"}

-- Constructor
function Inventory:new(o)

    o = o or {};
    setmetatable(o, self)
    self.__index = self
    self.items = {}
    self.flags = {}
    return o
    
end

-- Add an item to the inventory (accepts string)
function Inventory:addItem(i)

    table.insert(self.items, i)

end

-- Loads saves flags from data, or creates new save data if none is present.
function Inventory:flagInit()

    local json = require("json")

    local path = system.pathForFile("savedFlags.json",system.DocumentsDirectory)
    local listPath = system.pathForFile("flagList.json",system.ResourceDirectory)

    local saveFile = io.open(path, "r")
    if not saveFile then

        local newSaveFile = io.open(path, "w")
        local flagList = io.open(listPath, "r")

        local data = flagList:read("*a")
        io.close(flagList)
        flagList = nil

        local freshTable = json.decode(data)
        local freshSave = json.encode(freshTable)

        newSaveFile:write(freshSave)
        io.close(newSaveFile)
        saveFile = nil

    else

        local data = saveFile:read("*a")
        io.close(saveFile)
        saveFile = nil
        --print(data)
        local loadedFlags = json.decode(data)
        
        self.flags = loadedFlags

    end

end

-- Saves current flags to file.
function Inventory:flagSave()

    local json = require("json")
    local path = system.pathForFile("savedFlags.json",system.DocumentsDirectory)
    local saveString = json.encode(self.flags)

    local saveFile = io.open(path, "w")
    saveFile:write(saveString)
    io.close(saveFile)
    saveFile = nil

end

-- Set a scene flag with name f as true (accepts string)
function Inventory:setFlag(f)

    self.flags[f] = true

end

-- Search for and remove an item with name itemName (accepts string)
function Inventory:removeItem(itemName)

    local n = 0
    local found = false

    for k,v in ipairs(self.items) do

        if (v == itemName) then

            found = true
            n = k

        end

    end

    if (found) then table.remove(self.items, n) end

end

-- Searches the inventory for the given item name and returns a boolean indicating if that item is in the inventory (accepts string)
function Inventory:has(itemName)

    local found = false

    for k,v in ipairs(self.items) do

        if (v == itemName) then

            found = true

        end

    end

    return found

end

function Inventory:test()

    for k,v in ipairs(self.items) do

        print (k,v)

    end

end

return Inventory