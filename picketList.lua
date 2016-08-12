picketList = {}
picketCount = 0

function CreatePicket(x, y)
	picketList[picketCount] = Picket.create()
	picketList[picketCount]:reset(x,y)
	picketCount = picketCount + 1
end

function PicketListUpdate(dt)
	for i =0, picketCount-1 do
		picketList[i]:update(dt)
	end
end

function PicketListDelete()
	for i=0, picketCount-1 do
		picketList[i]=nil
	end
	picketCount=0
end

function PicketListDraw()
	for i=0, picketCount-1 do
		picketList[i]:draw()
	end
end
