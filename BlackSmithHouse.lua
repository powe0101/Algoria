
function CreateBlackSmithHouse(x, y)
	BlackSmithHouse = newAnimation(imgBSHouse,128,72,0.3,0)
	BlackSmithHouse:setMode("loop")
	BlackSmithHouse:SetAniPostion(x,y)
	BlackSmithHouse:play()
end

function BlackSmithHouseDraw()
	BlackSmithHouse:draw()
end

function BlackSmithHouseUpdate(dt)
	BlackSmithHouse:update(dt)
end