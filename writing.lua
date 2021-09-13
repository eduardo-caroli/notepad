writing = {}

function replace(text, pattern, replacement)
  pos = string.find(text, pattern)
  text = text:sub(1,pos-1)..replacement..text:sub(pos+#pattern, #text)
  return text
end

function replace_all(text, pattern, replacement)
  if string.find(text, pattern) == nil then
    return text
  else
    text = replace(text, pattern, replacement)
    return replace_all(text, pattern, replacement)
  end
end

function writing.load()
  texto_atual = ""
  textos = {}
  fonte = 30
  xTexto,yTexto = 400, 300
  love.graphics.setFont(love.graphics.newFont(fonte))
  upperCase= false
end

function writing.update(dt)
  xTexto, yTexto = xMouse, yMouse
end


function writing.draw()
  for i = 1, #textos do
    love.graphics.setFont(love.graphics.newFont(tonumber(textos[i][4])))
    local texto_a_imprimir = replace_all(textos[i][1], "|", "\n")
    love.graphics.print(texto_a_imprimir, textos[i][2], textos[i][3], 0)
  end
  love.graphics.setFont(love.graphics.newFont(fonte))
  love.graphics.setColor(0,0,0)
  love.graphics.print(texto_atual, xMouse, yMouse , 0, 1, 1)
end

function writing.mousepressed(x, y)
  texto_atual = replace_all(texto_atual, "\n", "|")
  table.insert(textos, {texto_atual, xTexto, yTexto, fonte})
  texto_atual = ''
end

function writing.keypressed(key)
  if key == 'capslock' then
    upperCase = true
  end
  if alfabeto:find(key) ~= nil then
    if upperCase then
      character = string.char(string.byte(key) - 32)
    else
      character = key
    end
    texto_atual = texto_atual..character
  end
  if key == 'space' then
    texto_atual = texto_atual ..' '
  end
  if key == 'return' then
    texto_atual = texto_atual..'\n'
  end
  if key == 'tab' then
    texto_atual = texto_atual..'\t'
  end
  if key == 'backspace' then
    texto_atual = texto_atual:sub(1, -2)
  end
  if key == 'lshift' then
    fonte = fonte -1
  end
  if key == 'rshift' then
    fonte = fonte+1
  end
end

function writing.keyreleased(key)
  if key == 'capslock' then
    upperCase = false
  end
end

return writing