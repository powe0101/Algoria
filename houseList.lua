function CreateHouse(x,y)
	houseList[houseCount] = House.create()
	houseList[houseCount]:reset(x,y)
	houseCount = houseCount + 1
end

function HouseListUpdate(dt)
	for i = 0, houseCount-1 do
    houseList[i]:update(dt)
  end
end

function HouseListDraw()
   for i=0, houseCount-1 do
     houseList[i]:draw(dt)
   end
end