groundList = {}
groundCount = 0
fallHalfGround = false

function CreateGround(x,y) --for문을 돌려서 외부에서 x,y값 받을 필요 없이 x,y도 리스트로 미리 선언해놓고.
  groundList[groundCount] = Ground.create()
  groundList[groundCount]:reset(x,y)
  groundCount = groundCount + 1
end

function GroundListUpdate(dt)
  for i = 0, groundCount-1 do
    groundList[i]:update(dt)
  end
end

function GroundListDelete()
   for i=0, groundCount-1 do
    groundList[i]=nil
   end
   groundCount=0
end

function GroundListDraw()
   for i=0, groundCount-1 do
     groundList[i]:draw()
   end
end

function GroundHalfFrameChange()
    fallHalfGround = true
end

function GroundFullFrameChange()
    fallHalfGround = true
end