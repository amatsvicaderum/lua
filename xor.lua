#!/usr/bin/lua

function xor (a, b)
  x = (not(a and b) and (a or b))
  return x
end

print("enter a:")
a = io.read("*n")

if a == 0 then
  a = false
else
  a = true
end
print("enter b:")
b = io.read("*n")

if b == 0 then
  b = false
else
  b = true
end

print(xor(a, b))
