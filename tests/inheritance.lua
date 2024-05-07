--------------------------------------------------------
-- [cuhHub] Tests - Inheritance
--------------------------------------------------------

--[[
    ----------------------------

    CREDIT:
        Author: @cuh6_ (Discord)
        GitHub Repository: https://github.com/cuhHub/Classes

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

---@param x number
---@param y number
---@param z number
function Vector3:move(x, y, z)
    self.x = self.x + x
    self.y = self.y + y
    self.z = self.z + z
end

-- Create Entity class
---@param self Entity
---@param type string
---@param position Vector3
local Entity = Class("Entity", function(self, type, position) ---@type Entity
    self.type = type
    self.position = position
end)

function Entity:info()
    print(("Entity (%s): %.1f, %.1f, %.1f"):format(self.type, self.position.x, self.position.y, self.position.z))
end

-- Create Enemy class
---@param self Enemy
---@param health number
---@param damage number
local Enemy = Class("Enemy", function(self, health, damage) ---@type Enemy
    self:initializeParent("Enemy", Vector3.new(0, 0, 0))
    self.health = health
    self.damage = damage
end, Entity)

-- Create Boss class
---@param self Boss
local Boss = Class("Boss", function(self) ---@type Boss
    self:initializeParent(1000, 100)
end, Enemy)

-- Create an entity
local MyEntity = Entity.new("Player", Vector3.new(0, 2, 0)) ---@type Entity
MyEntity:info()

-- Create an enemy
local MyEnemy = Enemy.new(100, 10) ---@type Enemy
MyEnemy:info()

-- Create a boss
local MyBoss = Boss.new() ---@type Boss
MyBoss:info()

-------------------------------
-- // Intellisense
-------------------------------
---@class Vector3: Class
---@field x number
---@field y number
---@field z number
---
---@field move fun(self: Vector3, x: number, y: number, z: number)

---@class Entity: Class
---@field type string
---@field position Vector3
---
---@field info fun(self: Entity)

---@class Enemy: Entity
---@field health number
---@field damage number

---@class Boss: Enemy