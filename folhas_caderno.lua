folhas_do_caderno = {}

local function desenha_caderno(pagina)
  love.graphics.setColor(.85,.6, .6)
  local x_inicio = (pagina-1) * 750
  for i = 1, 20 do
    love.graphics.line(0, i*35 + 35 + x_inicio, 800, i*35 + 35 + x_inicio)
  end
  love.graphics.setColor(0, .3, .85)
  love.graphics.line(50, 0+x_inicio, 50, 735 + x_inicio)
  love.graphics.setColor(0,0,0)
  love.graphics.rectangle('fill', 0, x_inicio + 736, 800, 13)
  love.graphics.line(0, x_inicio+750, 800, x_inicio+750)
  love.graphics.print(pagina, 750, x_inicio + 700)
end

function folhas_do_caderno.draw()
  desenha_caderno(pagina1)
  desenha_caderno(pagina2)
end

return folhas_do_caderno