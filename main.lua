--version 1.1
function distanceBetween(x1,x2,y1,y2)
  return math.sqrt((y2-y1)^2+(x2-x1)^2)
end

function onlychar(s)
  count = 0
  for i= 1, #s do
    char = string.sub(s,i,i) 
    if char == '+' or char == '-' or char == '*' or char == '/' then
    count = count + 1
  end
  end
  if string.sub(s,#s-1,#s-1) =='+' or count >1 or count == 0 or string.sub(s,#s-1,#s-1) =='-' or string.sub(s,#s-1,#s-1) =='*' or string.sub(s,#s-1,#s-1) =='/' then return true end
  if count == 1 then return false end
end
function love.draw()
  
  love.graphics.draw(backside,0,0)
  function colortext(text,x,y)
  love.graphics.setColor(0,0,1,1)
  love.graphics.setFont(Font)
  love.graphics.print(tostring(text),x,y)
  love.graphics.setColor(1,1,0,1)
  end
local x = 50
local y = 200
local radius = 40
local count = 0
for i=0, 1 do
love.graphics.setColor(1,1,0,1)
love.graphics.circle('fill', x, y, radius )
colortext(count,x-10,y-10)
x = x+90
count = count + 1
love.graphics.circle('fill', x, y, radius )
colortext(count,x-10,y-10)
x = x+90
count = count + 1
love.graphics.circle('fill', x, y, radius )
colortext(count,x-10,y-10)
x = x+90
count = count + 1
love.graphics.circle('fill', x, y, radius )
colortext(count,x-10,y-10)
x = x+90
count = count + 1
love.graphics.circle('fill', x, y, radius )
colortext(count,x-10,y-10)
count = count + 1
y = y + 100
x = 50
end
love.graphics.circle('fill', 50, 100, radius )
colortext('=',50-10,100-15)
  love.graphics.setColor(1,0,0.25)
  love.graphics.setFont(FontNumber)
  love.graphics.print(Number)
  love.graphics.setFont(Font_small)
  love.graphics.print(exNumber,100,100)
  love.graphics.setColor(0.419,0.819,0.0156)
  love.graphics.print('To enter a character select it on the keyboard.',0,140)
  love.graphics.setColor(1,1,0,1)
end

function love.load()
    firstNumber = ''
    secondNumber = ''
    Number = ''
    exNumber = ''
    Font = love.graphics.newFont("font.ttf", 30)
    Font_small = love.graphics.newFont("font.ttf", 15)
    FontNumber = love.graphics.newFont("fontNumber.ttf", 50)
    love.window.setMode(460, 350)
    backside = love.graphics.newImage("back ps.jpg")
    ico = love.image.newImageData("icone.png")
    love.window.setIcon(ico)
    love.window.setTitle("Calculator")
    number_buttons = {}
    local x = 50
    local y = 200
    radius = 40
    for i = 0, 9 do
      number_buttons[i] = {}
      number_buttons[i]['x'] = x
      number_buttons[i]['y'] = y
      x = x+ 90
      if i == 4 then y = y+100; x = 50; end
    end
    number_buttons['=']={x=50,y=100}
    --for k,v in pairs(number_buttons) do print(k,v.x,v.y) end
end

function love.mousepressed( x, y, button, istouch, presses )
  if button == 1 then
    for k,v in pairs(number_buttons) do
      if distanceBetween(v.x,x,v.y,y) < radius then
        Number = Number .. k
        end
      end
    end
end

function love.update(dt)
  if #Number>28 then
    Number = ''
  end
  if string.sub(Number,1,1) == '=' or string.sub(Number,1,1) == '0' or string.sub(Number,1,1) == '+' or string.sub(Number,1,1) == '-' or string.sub(Number,1,1) == '*' or string.sub(Number,1,1) == '/' then
    Number = ''
  end
  if string.sub(Number,#Number,#Number) == '=' then
    if onlychar(Number) then Number = ''
      else
    ni=i
    for i = 1, #Number do
      if string.sub(Number,i,i) == '+' or string.sub(Number,i,i) == '-' or string.sub(Number,i,i) == '*' or string.sub(Number,i,i) == '/' then
        firstNumber = string.sub(Number,1,i-1)
        secondNumber = string.sub(Number,i+1,#Number-1)
        ni=i
      end
    end
    exNumber = Number
    if string.sub(Number,ni,ni) == '+' then  Number = tostring(tonumber(firstNumber) + tonumber(secondNumber))
    elseif string.sub(Number,ni,ni) == '-' then Number = tostring(tonumber(firstNumber) - tonumber(secondNumber))
    elseif string.sub(Number,ni,ni) == '*' then Number = tostring(tonumber(firstNumber) * tonumber(secondNumber))
    elseif string.sub(Number,ni,ni) == '/' then Number = tostring(tonumber(firstNumber) / tonumber(secondNumber))
    end
  end
  end
  end
  
  function love.keypressed(key,scancode,isrepeat)
    if key == '=' or key == '+' or key == 'kp+' then
      Number = Number .. '+'
    end
    if key == '-' or key == '_' or key == 'kp-' then
      Number = Number .. '-'
    end
    if key == '*' or key == '8' or key == 'kp*' then
      Number = Number .. '*'
    end
    if key == '/' or key == '.' or key == 'kp/' then
      Number = Number .. '/'
    end
    if key == 'backspace' then
      Number = string.sub(Number,1,#Number-1)
    end
    if key == 'escape' then os.exit() end
    end
