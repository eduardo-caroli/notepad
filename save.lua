save = {}

function save.load()
  nome_do_arquivo = ''
end


function escreve_csv(filename, lista, titulos)
  local file = io.open(filename, 'w')
  linha_titulo = ''
  for a = 1, #titulos do
    linha_titulo = linha_titulo .. titulos[a]..';'
  end
  file:write(linha_titulo..'\n')
  for i = 1, #lista do
    local linha = ''
    for j = 1, #lista[i] do
      linha = linha..tostring(lista[i][j])..';'
    end
    file:write(linha..'\n')
  end
end


function save.draw()
  love.graphics.setColor(1,1,0)
  love.graphics.rectangle('fill', 200, 200 - yCam, 400, 200)
  lgsc(1,1,1)
  love.graphics.rectangle('fill', 250, 300 - yCam, 300, 50)
  love.graphics.setColor(0,0,0)
  love.graphics.rectangle('line', 200, 200 - yCam, 400, 200)
  love.graphics.rectangle('line', 250, 300 - yCam, 300, 50)
  love.graphics.setFont(love.graphics.newFont(30))
  lgp('nome do arquivo', 275, 250 - yCam)
  lgp(nome_do_arquivo, 250, 300 - yCam)
end

function save.update(dt)
  if arquivo_aberto then
    nome_do_arquivo= arquivo_a_abrir
  end
end


function save.mousepressed(x, y)
end

function save.keypressed(key)
  if alfabeto:find(key) ~= nil then
    nome_do_arquivo = nome_do_arquivo .. key
  end
  if key == 'return' then
    os.execute('mkdir '..nome_do_arquivo)
    escreve_csv(nome_do_arquivo..'/retangulos.csv', obj_retangulos, {'xVertice', 'yVertice', 'largura','altura', 'drawmode'})
    escreve_csv(nome_do_arquivo..'/circulos.csv', circles, {'xCentro', 'yCentro', 'raio','drawmode'})
    escreve_csv(nome_do_arquivo..'/linhas.csv', linhas, {'x1', 'y1'})
    escreve_csv(nome_do_arquivo..'/textos.csv', textos, {'string', 'xTexto', 'yTexto', 'tamanho fonte'})
    currState = linha
    comando = false
  end
end

return save