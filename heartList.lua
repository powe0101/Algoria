heartList = {}
heartCount = 0

function CreateHeart(x,y)
  heartList[heartCount] = Heart.create()
  heartList[heartCount]:reset(x,y)
  heartCount = heartCount + 1
end

function HeartListUpdate(dt)
  for i = 0, heartCount-1 do
    heartList[i]:update(dt)
  end
end

function HeartListDelete()
   for i=0, heartCount-1 do
    heartList[i]=nil
   end
   heartCount=0
end

function HeartListDraw()
   for i=0, heartCount-1 do
     heartList[i]:draw(dt)
   end
end