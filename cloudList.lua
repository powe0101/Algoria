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

function CloudListDraw()
   for i=0, cloudCount-1 do
     cloudList[i]:draw(dt)
   end
end