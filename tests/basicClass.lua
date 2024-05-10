--------------------------------------------------------
-- [Cuh4] Tests - Basic Class
--------------------------------------------------------

--[[
    ----------------------------

    CREDIT:
        Author: @cuh6_ (Discord)
        GitHub Repository: https://github.com/Cuh4/LuaClasses

    ----------------------------
]]

-------------------------------
-- // Setup
-------------------------------
-- Set package path
package.path = package.path..";../src/?.lua"

-- Dependencies
local Class = require("class")

-------------------------------
-- // Main
-------------------------------
-- Create a class
---@type MyClass
local MyClass = Class("MyClass", function(self, value)
    self.value = value or 5
end)

---@param amount integer
function MyClass:increment(amount)
    self.value = self.value + amount
end

-- Create an object descending from the class
---@type MyClass
local object = MyClass.new(6)
print(object.value)

object:increment(2)
print(object.value)

-------------------------------
-- // Intellisense
-------------------------------
---@class MyClass: ClassObject
---@field value number
---@field increment fun(self: MyClass, amount: integer)