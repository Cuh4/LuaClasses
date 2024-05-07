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

-- Create a class that descends from person
local Male = Class("Male", function(self, name)
    self:initializeParent(name, "Male") -- creates a temporary new person object and gathers all the attributes from it and places it into this class
end, Person) -- inherit from Person class. only useful if self:inheritParent() is called

-- Create a class that descends from person
local Female = Class("Female", function(self, name)
    self:initializeParent(name, "Female") -- creates a temporary new person object and gathers all the attributes from it and places it into this class
end)

-- Create an object from the Male class
local John = Male.new("John")
print(John.name) -- "John"

-- Create an object from the Female class
local Jane = Female.new("Jane")
print(Jane.name) -- "Jane"
```

The library can be found in `/src/class.lua`, and examples in `/examples`.

## ⚙️ Setup
- Run `git clone https://github.com/cuh4/LuaClasses`
- Navigate to `src` and extract `class.lua`