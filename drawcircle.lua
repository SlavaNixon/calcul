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