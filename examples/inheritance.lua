--------------------------------------------------------
-- [cuhHub] Examples - Inheritance
--------------------------------------------------------

--[[
    ----------------------------

    CREDIT:
        Author: @cuh6_ (Discord)
        GitHub Repository: https://github.com/cuhHub/Classes

    Description:
        An example showing creating a class that inherits from another class.

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
-- Create a number class
---@param self Number
---@param number number
local Number = Class("Number", function(self, number) ---@type Number
    self.number = number
end)

-- Create a large number class
---@param self LargeNumber
local LargeNumber = Class("LargeNumber", function(self) ---@type LargeNumber
    self:initializeParent(100000) -- 100000 is passed to the Number init function
end, Number)

-- Create a small number class
---@param self SmallNumber
local SmallNumber = Class("SmallNumber", function(self) ---@type SmallNumber
    self:initializeParent(1)
end, Number)

-- Create an even smaller number
---@param self SmallerNumber
local SmallerNumber = Class("SmallerNumber", function(self) ---@type SmallerNumber
    self:initializeParent()
    self.number = 0.01
end, SmallNumber)

-- Create objects
local number = Number.new(2) ---@type Number
print(number.number) -- 100000

local largeNumber = LargeNumber.new() ---@type LargeNumber
print(largeNumber.number)

local smallNumber = SmallNumber.new() ---@type SmallNumber
print(smallNumber.number) -- 1

local smallerNumber = SmallerNumber.new() ---@type SmallerNumber
print(smallerNumber.number) -- 0.01

-------------------------------
-- // Intellisense
-------------------------------
---@class Number: Class
---@field number number

---@class LargeNumber: Number
---@class SmallNumber: Number
---@class SmallerNumber: SmallNumber