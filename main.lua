
--MODULOS--

local linha = require 'linha'
local retangulos = require 'retangulos'
local circle = require 'circle'
local writing = require 'writing'
local save = require 'save'
local open = require 'open'
local folhas_do_caderno = require 'folhas_caderno'





--CONSTANTES--

lg = love.graphics
lgp = lg.print
lgr = lg.rectangle
lgc = lg.circle
lgl = lg.line
lgsc = lg.setColor
lgsbc = lg.setBackgroundColor
alfabeto = 'abcdefghijklmnopqrstuvwxyz?!.,-:;1234567890'


function floor(a, b)
  local resto = a%b
  local f = (a-resto)/b
  return f
end

--CALLBACKS--

function love.load()
  xCam, yCam = 0, 0
  open.load()
  save.load()
  linha.load()
  retangulos.load()
  circle.load()
  writing.load()
  currState = linha
  drawMode = 'line'
  caderno = true
  comando = false
  
end

function love.update(dt)
  pagina1 = floor(-yCam, 750) + 1
  pagina2 = floor((-yCam + 600), 750) + 1
  xMouse, yMouse = love.mouse.getPosition()
  xMouse = xMouse - xCam
  yMouse = yMouse - yCam
  currState.update(dt)
  if love.keyboard.isDown('up') then
    if yCam < 0 then
      yCam = yCam + 10
    end
  elseif love.keyboard.isDown('down') then
    yCam = yCam - 10
  end
end

function love.draw()
  love.graphics.setBackgroundColor(1,1,1)
  love.graphics.translate(xCam, yCam)
  folhas_do_caderno.draw()
  love.graphics.setColor(0,0,0)
  retangulos.draw()
  linha.draw()
  circle.draw()
  writing.draw()
  currState.draw()
  lgp(arquivo_a_abrir)
  lgp(nome_do_arquivo, 0, 20)
end

function love.keypressed(key)
  currState.keypressed(key)
  if key == 'rgui' or key == 'lgui' then
    comando = not comando
  end
  if comando then
    if key == 's' and currState ~= open then
      currState = save
    end
    if key == 'o' and currState ~= save then
      currState = open
    end
  end
  if currState ~= writing and currState ~= save and currState ~= open then
    if key == 'e' then
      linhas = {}
      obj_retangulos = {}
      circles = {}
    end
    if key == 'c' then
      currState = circle
    end
    if key == 'r' then
      currState = retangulos
    end
    if key == 'l' then
      currState = linha
    end
    if key == 'w' then
      currState = writing
    end
    if key == 'f' then
      if drawMode == 'line' then
        drawMode = 'fill'
      else
        drawMode = 'line'
      end
    end
  end
  if key == 'escape' then
    currState = linha
  end
end

function love.keyreleased(key)
  writing.keyreleased(key)
end

function love.mousepressed(x, y)
  currState.mousepressed(x, y)
end