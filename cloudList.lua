cloudList = {}
cloudCount = 0

function CreateCloud(x,y)
	cloudList[cloudCount] = Cloud.create()
	cloudList[cloudCount]:reset(x,y)
	cloudCount = cloudCount + 1
end

function CloudListUpdate(dt)
	for i = 0, cloudCount-1 do
    cloudList[i]:update(dt)
  end
end

function CloudListDelete()--07 21 근영 구름 초기화
   for i=0, cloudCount-1 do
    cloudList[i]=nil
   end
   cloudCount=0
end

function CloudListDraw()
   for i=0, cloudCount-1 do
     cloudList[i]:draw()
   end
end