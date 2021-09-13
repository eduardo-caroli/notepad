circle = {}

local function determina_raio(xM, yM, xC, yC)
  local x = (xM- xC)^2
  local y = (yM- yC)^2
  local raio = math.sqrt(x+y)
  return raio
end


function circle.load()
  circles = {}
  xCentro, yCentro = 400, 300
  raio = 0
  isCentro = true
end

function circle.update(dt)
  if not isCentro then
    raio = determina_raio(xMouse, yMouse, xCentro, yCentro)
  end
end

function circle.draw()
  for i = 1, #circles do
    love.graphics.circle(circles[i][4], circles[i][1], circles[i][2], circles[i][3])
  end
  if not isCentro then
    love.graphics.circle(drawMode, xCentro, yCentro, raio)
    love.graphics.line(xCentro - 3, yCentro, xCentro + 3, yCentro)
    love.graphics.line(xCentro , yCentro + 3, xCentro, yCentro - 3)
  end
  love.graphics.line(xMouse - 6, yMouse, xMouse + 6, yMouse)
  love.graphics.line(xMouse , yMouse + 6, xMouse, yMouse - 6)
end

function circle.mousepressed(x, y)
  if isCentro then
    xCentro, yCentro = x - xCam, y - yCam
  else
    table.insert(circles,{xCentro, yCentro, raio, drawMode})
  end
  isCentro = not isCentro
end

function circle.keypressed(key)
end




return circle