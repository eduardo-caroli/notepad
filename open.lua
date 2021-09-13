open = {}

function le_csv_linha(filename, lista)
  file = io.open(filename, 'r')
  t = {}
  for line in file:lines() do
    if line ~= '' then
      table.insert(t, line)
    end
  end
  for i = 1, #t do
    local linha = le_linha(t[i], ';')
    for p = 1, #linha do
      linha[p] = tonumber(linha[p])
    end
    table.insert(lista, linha)
  end
  return lista
end

function separa(string, char)
  char = '['..char..']'
  valores = {}
  while string:find(char) ~= nil do
    posicao = string:find(char)
    valor = string:sub(1, posicao - 1)
    string = string:sub(posicao + 1, -1)
    table.insert(valores, (valor))
  end
  table.insert(valores, string)
  return valores
end

function le_linha(linha, char)
  local valores = separa(linha, char)
  return valores
end

function le_csv(filename, lista)
  t = {}
  local file = io.open(filename, 'r')
  for line in file:lines() do
    table.insert(t, line)
  end
  for i = 2, #t do
    t[i] = t[i]:sub(1, -2)
    table.insert(lista, le_linha(t[i], ';'))
  end
  return lista
end


function open.load()
  arquivo_a_abrir = ''
  arquivo_aberto = false
end


function open.update(dt)
end

function open.draw()
  love.graphics.setColor(1,1,0)
  love.graphics.rectangle('fill', 200, 200, 400, 200)
  lgsc(1,1,1)
  love.graphics.rectangle('fill', 250, 300, 300, 50)
  love.graphics.setColor(0,0,0)
  love.graphics.rectangle('line', 200, 200, 400, 200)
  love.graphics.rectangle('line', 250, 300, 300, 50)
  love.graphics.setFont(love.graphics.newFont(30))
  lgp('nome do arquivo', 275, 250)
  lgp(arquivo_a_abrir, 250, 300)
end

function open.mousepressed(x,y)
end

function open.keypressed(key)
  if alfabeto:find(key) ~= nil then
    arquivo_a_abrir = arquivo_a_abrir..key
  end
  if key == 'return' then
    obj_retangulos = le_csv(arquivo_a_abrir..'/retangulos.csv', obj_retangulos)
    circles = le_csv(arquivo_a_abrir..'/circulos.csv', circles)
    linhas = le_csv_linha(arquivo_a_abrir..'/linhas.csv', linhas)
    textos = le_csv(arquivo_a_abrir..'/textos.csv', textos)
    arquivo_aberto = true
    currState = linha
    comando = false
  end
end
return open