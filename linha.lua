linha = {}

function linha.load()
  linhas = {}
  linha_atual = {}
  linha_temporaria = {}
  timer_linhas = 0
end

function linha.update(dt)
  if love.mouse.isDown(1) then
    table.insert(linha_atual, xMouse)
    table.insert(linha_atual, yMouse)
    table.insert(linha_temporaria, xMouse)
    table.insert(linha_temporaria, yMouse)
  else
    timer_linhas = timer_linhas + dt
    if timer_linhas > .2 and timer_linhas < .3 then
      table.insert(linhas, linha_atual)
      linha_atual = {}
      linha_temporaria = {}
      timer_linhas = 0
    end
  end
end
    
function linha.draw()
  for i = 1, #linhas do
    for j = 1, #linhas[i] - 3, 2 do
      love.graphics.setColor(0,0,1)
      love.graphics.line(linhas[i][j], linhas[i][j+1], linhas[i][j+2], linhas[i][j+3])
    end
  end
  for i = 1, #linha_temporaria - 3, 2 do
    love.graphics.setColor(1,0,0)
    love.graphics.line(linha_temporaria[i], linha_temporaria[i+1], linha_temporaria[i+2], linha_temporaria[i+3])
  end
end

function linha.mousepressed(x, y)
end

function linha.keypressed(key)
end

return linha