local Inventory = {tag = "inventory"}

-- Constructor
function Inventory:new(o)

    o = o or {};
    setmetatable(o, self)
    self.__index = self
    self.items = {}
    return o
    
end

-- Add an item to the inventory (accepts string)
function Inventory:addItem(i)

    table.insert(self.items, i)

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