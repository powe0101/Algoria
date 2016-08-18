backGroundList = {}
backGroundCount = 0

function CreateBackGround(x,y)
	backGroundList[backGroundCount] = BackGround.create()
	backGroundList[backGroundCount]:reset(x,y)
	backGroundCount = backGroundCount + 1
end

function BackGroundListUpdate(dt)
	for i = 0, backGroundCount-1 do
    backGroundList[i]:update(dt)
  end
end

function BackGroundListDelete()--07 21 근영 구름 초기화
   for i=0, backGroundCount-1 do
    backGroundList[i]=nil
   end
   backGroundCount=0
end

function BackGroundListDraw()
   for i=0, backGroundCount-1 do
     backGroundList[i]:draw()
   end
end