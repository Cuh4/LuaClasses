# Cuh4 - Lua Classes

## 📚 Overview
A Lua library that allows you to create classes with support for class inheritance without metatables. Tested with Lua 5.4.2.

```lua
local Class = require("class")

-- Create a class
local Person = Class("Person", function(self, name, gender) -- function is called instantly. used to run logic and create attributes, etc
    self.name = name
    self.gender = gender
end)

-- Create a class that descends from Person
local Male = Class("Male", function(self, name)
    self:initializeParent(name, "Male") -- creates a temporary new Person object, gathers all the attributes created via its init function, and places it into this class
end, Person) -- inherit from Person class. only useful if self:initializeParent() is called

-- Create a class that descends from Person
local Female = Class("Female", function(self, name)
    self:initializeParent(name, "Female")
end, Person)

-- Create an object from the Male class
local John = Male.new("John")
print(John.name) -- "John"

-- Create an object from the Female class
local Jane = Female.new("Jane")
print(Jane.name) -- "Jane"
```

## 😎 Examples
Examples can be found in `/examples`.

To run an example, use the following commands (this assumes you've `git clone`'d the repo and you're in the repo directory):
```bat
cd lua
lua.exe ../examples/EXAMPLE_NAME.lua
```
Replace `EXAMPLE_NAME.lua` with the file name of the example you want to try out.

## ❓ Why not use metatables?
This library was mainly created for me to use when creating mods for a game that uses Lua for mods, but doesn't allow metatables.

Normally, I would use metatables for OOP though.

## ❔ Intellisense
**Intellisense is supported**, but you will have to define classes with `---@class`. Check out the examples to see an example of this.

Note that you'll need to use [this extension.](https://luals.github.io)

## ⚙️ Setup
- Run `git clone https://github.com/Cuh4/LuaClasses`
- Navigate to `src` and extract `class.lua`