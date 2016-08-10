-- easy.lua v0.1

-- Copyright (c) 2016 Ulysse Ramage
-- Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
-- The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

local easing = {
  quad    = "p * p",
  cubic   = "p * p * p",
  quart   = "p * p * p * p",
  quint   = "p * p * p * p * p",
  expo    = "2 ^ (10 * (p - 1))",
  sine    = "-math.cos(p * (math.pi * .5)) + 1",
  circ    = "-(math.sqrt(1 - (p * p)) - 1)",
  back    = "p * p * (2.7 * p - 1.7)",
  elastic = "-(2^(10 * (p - 1)) * math.sin((p - 1.075) * (math.pi * 2) / .3))"
}

local func = {}

local makefunc = function(str, expr)
  local load = loadstring or load
  return load("return function(p) " .. str:gsub("%$e", expr) .. " end")()
end

--all credits to rxi

for k, v in pairs(easing) do
  func[k .. "in"] = makefunc("return $e", v)
  func[k .. "out"] = makefunc([[
    p = 1 - p
    return 1 - ($e)
  ]], v)
  func[k .. "inout"] = makefunc([[
    p = p * 2 
    if p < 1 then
      return .5 * ($e)
    else
      p = 2 - p
      return .5 * (1 - ($e)) + .5
    end 
  ]], v)
end

local function easy(value, type)
  return func[type](value)
end

return easy
