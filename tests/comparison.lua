--------------------------------------------------------
-- [Cuh4] Tests - Comparison
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
-- Create Vector3 class
---@param self Vector3
---@param x number
---@param y number
---@param z number
local Vector3 = Class("Vector3", function(self, x, y, z) ---@type Vector3
    self.x = x
    self.y = y
    self.z = z
end)

function Vector3:format()
    return string.format("Vector3(%s, %s, %s)", self.x, self.y, self.z)
end

-- Create Vector2 class
---@param self Vector2
---@param x number
---@param y number
local Vector2 = Class("Vector2", function(self, x, y) ---@type Vector2
    self.x = x
    self.y = y
end)

function Vector2:format()
    return string.format("Vector2(%s, %s)", self.x, self.y)
end

-- Create a Vector3
local MyVector3 = Vector3.new(0, 0, 0) ---@type Vector3
print(MyVector3:format())

-- Create a vector2
local MyVector2 = Vector2.new(0, 0) ---@type Vector2
print(MyVector2:format())

-- Compare
print("MyVector3 == MyVector2:")
print(MyVector3:isSameType(MyVector2))

print("MyVector2 == MyVector3:")
print(MyVector2:isSameType(MyVector3))

print("MyVector3 == MyVector3:")
print(MyVector3:isSameType(MyVector3))

print("MyVector2 == MyVector2:")
print(MyVector2:isSameType(MyVector2))

print("MyVector2 == AnotherVector2")
print(MyVector2:isSameType(Vector2.new(10, 2, 0)))

-------------------------------
-- // Intellisense
-------------------------------
---@class Vector3: ClassObject
---@field x number
---@field y number
---@field z number
---
---@field format fun(self: Vector3): string

---@class Vector2: ClassObject
---@field x number
---@field y number
---
---@field format fun(self: Vector2): string