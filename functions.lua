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