--------------------------------------------------------
-- [Cuh4] Examples - Basic
--------------------------------------------------------

--[[
    ----------------------------

    CREDIT:
        Author: @cuh6_ (Discord)
        GitHub Repository: https://github.com/Cuh4/Classes

    Description:
        An example showing how to create a class, and how to create an object from a class.

    ----------------------------
]]

-------------------------------
-- // Setup
-------------------------------
-- Set package path (assumes you're in the /lua directory)
package.path = package.path..";../src/?.lua"

-- Dependencies
local Class = require("class")

-------------------------------
-- // Main
-------------------------------
-- Create a class
local MyClass = Class("MyClass", function(self, value) ---@type MyClass
    self.value = value
end)

-- Create methods
function MyClass:increment(amount)
    self.value = self.value + amount
end

-- Create an object
local MyObject = MyClass.new(10) ---@type MyClass
MyObject:increment(5)

print(MyObject.value) -- 15

-------------------------------
-- // Intellisense
-------------------------------
---@class MyClass: ClassObject
---@field value number
---@field increment fun(self: MyClass, amount: integer)