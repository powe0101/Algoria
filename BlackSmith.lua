itemBoxWidth = 30
itemBoxHeight = 30

function CheckBlackSmith()
	if love.keyboard.isDown('up') and stageLevel == 0 then
		if 50 < pl:GetX() and pl:GetX() < 78 then --265 295
			CheckBlackSmithIn()
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
	love.graphics.print("Weapon",185,20)
	love.graphics.rectangle("fill",185,40,itemBoxWidth,itemBoxHeight)
	love.graphics.rectangle("fill",235,40,itemBoxWidth,itemBoxHeight)
	love.graphics.rectangle("fill",285,40,itemBoxWidth,itemBoxHeight)
	love.graphics.rectangle("fill",335,40,itemBoxWidth,itemBoxHeight)
	love.graphics.rectangle("fill",385,40,itemBoxWidth,itemBoxHeight)

	love.graphics.print("Armor",185,100)
	-- 아이템 획득 전 0805
	love.graphics.rectangle("line",185,120,itemBoxWidth,itemBoxHeight)
	love.graphics.rectangle("line",235,120,itemBoxWidth,itemBoxHeight)
	love.graphics.rectangle("line",285,120,itemBoxWidth,itemBoxHeight)
	love.graphics.rectangle("line",335,120,itemBoxWidth,itemBoxHeight)
	love.graphics.rectangle("line",385,120,itemBoxWidth,itemBoxHeight)
	-- 아이템 획득 후 0805
	love.graphics.setColor(255,255,255,255)
	love.graphics.draw(imgMask,185,120)
	love.graphics.draw(imgWing,235,120)
	love.graphics.draw(imgHorse,285,120)
	love.graphics.draw(imgEisen,335,120)
end

function ControlBlackSmith()
	if blacksmithCheck then
		if love.keyboard.isDown("escape") then
			blacksmithCheck = false
		end
	end
end