riverList = {}
riverCount = 0

function CreateRiver(x,y)
  riverList[riverCount] = River.create()
  riverList[riverCount]:reset(x,y)
  riverCount = riverCount + 1
end

function RiverListUpdate(dt)
  for i = 0, riverCount-1 do
    riverList[i]:update(dt)
  end
end

function DeleteRiver()--07 21 근영 구름 초기화
   for i=0, riverCount-1 do
    riverList[i]=nil
   end
   riverCount=0
end

function RiverListDraw()
   for i=0, riverCount-1 do
     riverList[i]:draw(dt)
   end
end