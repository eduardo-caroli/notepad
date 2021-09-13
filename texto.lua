writing = {}

function writing.load()
  texto_atual = ""
  textos = {}
end


function writing.draw()
  for i = 1, #textos do
    love.graphics.print(texto, 200, 200)
  end
end

function writing.keypressed(key)
  local alfabeto = "abcdefghijklmnopqrstuvwxyz?!.,:;'"
  if alfabeto:find(key) ~= nil then
    texto_atual = texto_atual..key
  end
  if key == 'space' then
    texto_atual = texto_atual ..' '
  end
  if key == return then
    texto_atual = texto_atual..'\n'
  end
  if key == 'backspace' then
    texto_atual = texto_atual:sub(1, -2)
  end
end

return writing