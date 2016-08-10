chiefHouseList = {}
chiefHouseCount = 0

function CreateChiefHouse(x,y)
	chiefHouseList[chiefHouseCount] = ChiefHouse.create()
	chiefHouseList[chiefHouseCount]:reset(x,y)
	chiefHouseCount = chiefHouseCount + 1
end

function ChiefHouseListUpdate(dt)
	for i = 0, chiefHouseCount-1 do
    chiefHouseList[i]:update(dt)
  end
end

function ChiefHouseListDelete()
   for i=0, chiefHouseCount-1 do
    chiefHouseList[i]=nil
   end
   chiefHouseCount=0
end

function ChiefHouseListDraw()
   for i=0, chiefHouseCount-1 do
     chiefHouseList[i]:draw()
   end
end