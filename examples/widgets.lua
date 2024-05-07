--------------------------------------------------------
-- [Cuh4] Examples - Widgets
--------------------------------------------------------

--[[
    ----------------------------

    CREDIT:
        Author: @cuh6_ (Discord)
        GitHub Repository: https://github.com/Cuh4/Classes

    Description:
        A UI-based example. Note that there isn't actually UI, but the logic is there.

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
-- // Create classes
-- Create a Vector2
---@param x number
---@param y number
local Vector2 = Class("Vector2", function(self, x, y) ---@type Vector2
    self.x = x
    self.y = y
end)

-- Create a UI widget
---@param self UIWidget
---@param position Vector2
---@param size Vector2
---@param type string
local UIWidget = Class("UIWidget", function(self, position, size, type) ---@type UIWidget
    self.position = position
    self.size = size
    self.type = type
    self.parentWidget = nil
    self.children = {}
end)

function UIWidget:insert(widget)
    table.insert(self.children, widget)
    return self
end

function UIWidget:treeVisual(depth)
    if not depth then
        depth = 1
    end

    print(("-"):rep(depth * 2)..(" [%s] %s | Size(%.1f, %.1f), Position(%.1f, %.1f), Children: #%d"):format(self.type, self:visualize(), self.size.x, self.size.y, self.position.x, self.position.y, #self.children))

    for _, child in pairs(self.children) do
        child:treeVisual(depth + 1)
    end
end

function UIWidget:visualize()
    return "Widget"
end

-- Create a canvas
---@param self Canvas
local Canvas = Class("UI", function(self) ---@type Canvas
    self:initializeParent(Vector2.new(0, 0), Vector2.new(1920, 1080), "Canvas")
end, UIWidget)

function Canvas:visualize()
    return "Canvas"
end

-- Create a button
---@param self Button
---@param position Vector2
---@param size Vector2
local Button = Class("Button", function(self, position, size) ---@type Button
    self:initializeParent(position, size, "Button")
    self.isClicked = false
end, UIWidget)

function Button:visualize()
    return self.isClicked and "Clicked" or "Not Clicked"
end

-- Create text
---@param self Text
---@param text string
---@param position Vector2
---@param size Vector2
local Text = Class("Text", function(self, text, position, size) ---@type Text
    self:initializeParent(position, size, "Text")
    self.text = text
end, UIWidget)

function Text:visualize()
    return self.text
end

-- // Create UI
-- Create widgets
local canvas = Canvas.new() ---@type Canvas
local button = Button.new(Vector2.new(0, 0), Vector2.new(100, 100)) ---@type Button
local text = Text.new("Hello World", Vector2.new(0, 100), Vector2.new(100, 100)) ---@type Text
local text2 = Text.new("rooted", Vector2.new(0, 100), Vector2.new(100, 100)) ---@type Text
local text3 = Text.new("root2", Vector2.new(0, 100), Vector2.new(100, 100)) ---@type Text
local button2 = Button.new(Vector2.new(0, 200), Vector2.new(100, 100)) ---@type Button

-- Insert widgets
canvas:insert(button)
button:insert(text)
text:insert(text2)
text:insert(text3)
text3:insert(button2)

-- Visualize
canvas:treeVisual()
--[[
    Results in:

    -- [Canvas] Canvas | Size(1920.0, 1080.0), Position(0.0, 0.0), Children: #1
    ---- [Button] Not Clicked | Size(100.0, 100.0), Position(0.0, 0.0), Children: #1
    ------ [Text] Hello World | Size(100.0, 100.0), Position(0.0, 100.0), Children: #2
    -------- [Text] rooted | Size(100.0, 100.0), Position(0.0, 100.0), Children: #0
    -------- [Text] root2 | Size(100.0, 100.0), Position(0.0, 100.0), Children: #1
    ---------- [Button] Not Clicked | Size(100.0, 100.0), Position(0.0, 200.0), Children: #0
]]

-------------------------------
-- // Intellisense
-------------------------------
---@class Vector2: Class
---@field x number
---@field y number

---@class UIWidget: Class
---@field position Vector2
---@field size Vector2
---@field type string
---@field parentWidget UIWidget
---@field children UIWidget[]
---
---@field visualize fun(self: UIWidget): string
---@field insert fun(self: UIWidget, widget: UIWidget): UIWidget
---@field treeVisual fun(self: Canvas, depth: number|nil)

---@class Canvas: UIWidget
---@field children UIWidget[]

---@class Button: UIWidget
---@field isClicked boolean

---@class Text: UIWidget
---@field text string