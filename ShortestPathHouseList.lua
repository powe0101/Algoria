ShortestPathtHouseList = {}
ShortestPathtHouseCount = 0

function CreateChiefHouse(x,y,_type)
	ShortestPathtHouseList[ShortestPathtHouseCount] = ShortestPathtHouse.create()
	ShortestPathtHouseList[ShortestPathtHouseCount]:reset(x,y,_type)
	ShortestPathtHouseCount = ShortestPathtHouseCount + 1
end

function ShortestPathtouseListDraw()
   for i=0, ShortestPathtHouseCount-1 do
     ShortestPathtHouseList[i]:draw()
   end
end
