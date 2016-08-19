io.stdout:setvbuf'no' 

ease = require "easy" --require the library

value = 0

function love.load()
  
  love.graphics.setNewFont(18)
  
  ease:add("linear", "x")
  
end

function love.update(dt)
  
  value = (value + dt) % 1
  
end

function drawLine(easing, x, y, width, height, length)
  
  local segments = 48
  
  local vertices = {}
  
  for i = 1, segments*2, 2 do
    
    local tmp = length / segments * (i - 1) / 2
    
    vertices[i] = x + tmp * width
    vertices[i + 1] = y - ease(easing, tmp) * height
    
  end
  
  love.graphics.line(vertices)
  
end

function love.draw()
  
  local width, height = love.graphics.getDimensions()
  local x, y = value
  
  love.graphics.setPointSize(10)
  
  y = ease("linear", value)
  love.graphics.points( width*.1 + x * (width*.3), height*.4 - y * (height*.3) )
  love.graphics.printf("linear", 0, height*.4+12, width*.5, "center")
  drawLine("linear", width*.1, height*.4, width*.3, height*.3, x)
  
  y = ease("circinout", value)
  love.graphics.points( width*.6 + x * (width*.3), height*.4 - y * (height*.3) )
  love.graphics.printf("circinout", width*.5, height*.4+12, width*.5, "center")
  drawLine("circinout", width*.6, height*.4, width*.3, height*.3, x)
  
  y = ease("quintin", value)
  love.graphics.points( width*.1 + x * (width*.3), height*.9 - y * (height*.3) )
  love.graphics.printf("quintin", 0, height*.9+12, width*.5, "center")
  drawLine("quintin", width*.1, height*.9, width*.3, height*.3, x)
  
  y = ease("elasticout", value)
  love.graphics.points( width*.6 + x * (width*.3), height*.9 - y * (height*.3) )
  love.graphics.printf("elasticout", width*.5, height*.9+12, width*.5, "center")
  drawLine("elasticout", width*.6, height*.9, width*.3, height*.3, x)
  
end
