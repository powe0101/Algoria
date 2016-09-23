
itemBoxWidth = 30
itemBoxHeight = 30

function CreateBlackSmithHouse(x, y)
	BlackSmithHouse = newAnimation(imgBSHouse,128,72,0.3,0)
	BlackSmithHouse:setMode("loop")
	BlackSmithHouse:SetAniPostion(x,y)
	BlackSmithHouse:play()
end

function BlackSmithHouseDraw()
	if BlackSmithHouse == nil then
		return
	end

	BlackSmithHouse:draw()
end

function BlackSmithHouseUpdate(dt)
	BlackSmithHouse:update(dt)
end

function CheckBlackSmith()
	if love.keyboard.isDown('up') and stageLevel == 0 and tutorialProgressLevel > 3 then
		if 450 < pl:GetX() and pl:GetX() < 470 then
			if firstTalkWithBlacksmith then
				blacksmithTalkCheck = true
			else
				CheckBlackSmithIn()
			end
		end
	end
end

function CheckBlackSmithIn()
	blacksmithCheck = true
end

function DrawBlackSmith()
	love.graphics.setColor(0,0,0,255)
	DrawRectangle(80,5,145,80)
	love.graphics.setColor(255,255,255,255)
	love.graphics.rectangle("fill",162,12,286,156)

	love.graphics.setColor(0,0,0,255)
	love.graphics.print("Item",185,20)
	love.graphics.rectangle("line",185,40,itemBoxWidth,itemBoxHeight)
	love.graphics.rectangle("line",235,40,itemBoxWidth,itemBoxHeight)
	love.graphics.rectangle("line",285,40,itemBoxWidth,itemBoxHeight)
	love.graphics.rectangle("line",335,40,itemBoxWidth,itemBoxHeight)
	love.graphics.rectangle("line",385,40,itemBoxWidth,itemBoxHeight)

  love.graphics.setColor(255,255,255,255)
	if isTutorialClear == true then
		love.graphics.draw(imgSavePaper,185,40)
		love.graphics.draw(imgMask,235,120)
		love.graphics.draw(imgSword,185-1,120-1)
	end
	if isSpringClear == true then
		love.graphics.draw(imgStone,235,40)
		love.graphics.draw(imgWing,285,120)
		love.graphics.draw(imgSword2,185-1,120-1)
	end
	if isSummerClear == true then
		love.graphics.draw(imgSStone,285,40)
		love.graphics.draw(imgHorse,335,120)
		love.graphics.draw(imgSword3,185-1,120-1)
	end
	if isFallClear == true then
		love.graphics.draw(imgFStone,335,40)
		love.graphics.draw(imgEisen,385,120)
		love.graphics.draw(imgSword4,185-1,120-1)
	end
	if isWinterClear == true then
		love.graphics.draw(imgWStone,385,40)
		love.graphics.draw(imgSword5,185-1,120-1)
	end

  love.graphics.setColor(0,0,0,255)

	love.graphics.print("Equipment",185,100)
	love.graphics.rectangle("line",185,120,itemBoxWidth,itemBoxHeight)
	love.graphics.rectangle("line",235,120,itemBoxWidth,itemBoxHeight)
	love.graphics.rectangle("line",285,120,itemBoxWidth,itemBoxHeight)
	love.graphics.rectangle("line",335,120,itemBoxWidth,itemBoxHeight)
	love.graphics.rectangle("line",385,120,itemBoxWidth,itemBoxHeight)
	love.graphics.setColor(255,255,255,255)
end

function ControlBlackSmith()
	if firstTalkWithBlacksmith then --대화를 한 번 끝냈다면 동작 안시킴.
		if blacksmithTalkCheck then
			if love.keyboard.isDown("escape") then
				blacksmithTalkCheck = false
			end

			if love.keyboard.isDown('return') then --이 대화를 거쳐야만 다시 스테이지로 이동할 수 있음.
				blacksmithTalkCheck = false
				firstTalkWithBlacksmith = false
				portalBlock = true
				QMarkListDelete()
				CheckBlackSmithIn()
			end
		end
	end

	if blacksmithCheck then
		if love.keyboard.isDown("escape") then
			blacksmithCheck = false
		end
	end
end
