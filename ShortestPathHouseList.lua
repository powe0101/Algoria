ShortestPathtHouseList = {}
ShortestPathtHouseCount = 0

function CreateShortestPathtHouse(x,y,_type)
	ShortestPathtHouseList[ShortestPathtHouseCount] = ShortestPathHouse.create()
	ShortestPathtHouseList[ShortestPathtHouseCount]:reset(x,y,_type)
	ShortestPathtHouseCount = ShortestPathtHouseCount + 1
end

function ShortestPathHouseListDraw()
   for i=0, ShortestPathtHouseCount-1 do
     ShortestPathtHouseList[i]:draw()
   end
end

function ShortestPathHouseListDelete()
   for i=0, ShortestPathtHouseCount-1 do
    ShortestPathtHouseList[i]=nil
   end
   ShortestPathtHouseCount=0
end
