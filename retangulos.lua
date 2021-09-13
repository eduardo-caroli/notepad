retangulos = {}

function retangulos.load()
  obj_retangulos = {}
  xVertice = 400
  yVertice = 300
  alturaRetangulo = 0
  larguraRetangulo = 0
  vertice1 = true
end

function retangulos.draw()
  for i = 1, #obj_retangulos do
    love.graphics.rectangle(obj_retangulos[i][5],obj_retangulos[i][1], obj_retangulos[i][2], obj_retangulos[i][3], obj_retangulos[i][4])
  end
  if not vertice1 then
    love.graphics.rectangle(drawMode, xVertice, yVertice, larguraRetangulo, alturaRetangulo)
  end
end

function retangulos.update(dt)
  if not vertice1 then
    alturaRetangulo = yMouse - yVertice
    larguraRetangulo = xMouse - xVertice
  end
end

function retangulos.keypressed()
end

function retangulos.mousepressed(x, y)
  if vertice1 then
    xVertice, yVertice = x- xCam, y - yCam
  else
    table.insert(obj_retangulos, {xVertice, yVertice, larguraRetangulo, alturaRetangulo, drawMode})
  end
  vertice1 = not vertice1
end

return retangulos