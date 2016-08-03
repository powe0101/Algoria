houseList = {}
houseCount = 0

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

function HouseListDelete()--07 22 House만 추가 안해놨길래 만들음.
   for i=0, houseCount-1 do
   houseList[i]=nil
   end
   houseCount=0
end

function HouseListDraw()
   for i=0, houseCount-1 do
     houseList[i]:draw(dt)
   end
end