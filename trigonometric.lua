#!/usr/bin/lua
print("'d ^ r'{required} for[deg. | rad.]")
print("expected input: '<d ^ r> <angle>'\n")

local angle = io.read("*l")
print("'s ^ c ^ t'{required} for[sin | cos | tan]")

local operator = io.read("*l")
local angle_array = {}

local input_angle = {"D", "R", "d", "r"}
local type_deg = {"D", "d"}
local type_rad = {"R", "r"}
local input_operator = {"s", "c", "t"}

for i in angle:gmatch("%S+") do
  table.insert(angle_array, i)
end

local angle_type = angle_array[1]
local angle_value = tonumber(angle_array[2])

function tr_rad(a, b)
  for i = 1, #input_angle do
    if type(b) ~= "number" then
      b = "!number"
      return b
    end
    if a == input_angle[i] then
      for j = 1, #type_deg do
        if a == type_deg[j] then
          b = math.rad(b)
          return b
        end
        if a == type_rad[j] then
          return b
        end
      end
    end
  end
  b = "type{!valid}"
  return b
end

function tr_operation(b, c)
  for i = 1, #input_operator do
    if b == "type{!valid}" then
      return b
    end
    if type(b) ~= "number" then
      b = "!number"
      return b
    end
    if c == input_operator[i] then
      if c == input_operator[1] then
        b = math.sin(b)
        return b
      end
      if c == input_operator[2] then
        b = math.cos(b)
        return b
      end
      if c == input_operator[3] then
        b = math.tan(b)
        return b
      end
    end
  end
  b = "operation{!valid}"
  return b
end

local result = tr_operation(tr_rad(angle_type, angle_value), operator)

print("\n  output : " .. result .. "\n")
