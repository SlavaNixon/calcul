fullsize = 0
function love.draw()
    love.graphics.print('1',0,0)
    love.graphics.print('Hello World!', 100, 100)
    love.graphics.setColor(255,0,0)
    love.graphics.print(tostring(os.clock()),200,200)
    love.graphics.print(tostring(_VERSION),500,500)
    love.graphics.arc( "fill", 400, 300, 100, math.pi/4, math.pi/2 )
end
function love.update(dt)
  h = 100
  w = 100
   if love.keyboard.isDown("up") then
     h = h +5
     w = w +10
   end
end
function love.load()
  love.window.setFullscreen(true, "desktop")
end
function love.mousepressed(x, y, button, istouch)
if button == 2 then os.exit() end
if button == 1 and fullsize == 0 then love.window.setFullscreen(false, "desktop") fullsize = 1
elseif button == 1 and fullsize == 1 then love.window.setFullscreen(true, "desktop") fullsize = 0 end
  end