blackSmithHouseList = {}
blackSmithHouseCount = 0

function CreateBlackSmithHouse(x,y)
	blackSmithHouseList[blackSmithHouseCount] = BlackSmithHouse.create()
	blackSmithHouseList[blackSmithHouseCount]:reset(x,y)
	blackSmithHouseCount = blackSmithHouseCount + 1
end

function BlackSmithHouseListUpdate(dt)
	for i = 0, blackSmithHouseCount-1 do
    blackSmithHouseList[i]:update(dt)
  end
end

function BlackSmithHouseListDelete()
   for i=0, blackSmithHouseCount-1 do
   blackSmithHouseList[i]=nil
   end
   blackSmithHouseCount=0
end

function BlackSmithHouseListDraw()
   for i=0, blackSmithHouseCount-1 do
     blackSmithHouseList[i]:draw()
   end
end