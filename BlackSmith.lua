BlackSmith = {}
BlackSmith.__index = BlackSmith

blacksmith_frames = {}
blacksmith_frames[0] = love.graphics.newQuad(0,0,50,40,50,40)

function BlackSmith.create()
	local self = {}
	setmetatable(self, BlackSmith)
	self:reset()
	return self
end

function BlackSmith:reset(x,y)
	self.frame = 1
	self.x = x
	self.y = y

	blacksmith_now_frames = blacksmith_frames[0]
end

function BlackSmith:normal(dt)
	self=BackgroundNormal(self,dt)
end

function BlackSmith:UpdateMove(dt)
	self=BackgroundMove(self,dt)
  end

function BlackSmith:update(dt)
	self:UpdateMove(dt)
	self:normal(dt)
end

function BlackSmith:draw()
	love.graphics.draw(imgblacksmith,blacksmith_now_frames,self.x,self.y)
end

itemBoxWidth = 30
itemBoxHeight = 30

function CheckBlackSmith()
	if love.keyboard.isDown('up') and stageLevel == 0 then
		if 450 < pl:GetX() and pl:GetX() < 470 then
			CheckBlackSmithIn()
		end
	end
end

itemBoxWidth = 30
itemBoxHeight = 30

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
		love.graphics.draw(imgMask,185,120)
	end
	if isSpringClear == true then
		love.graphics.draw(imgStone,235,40)
		love.graphics.draw(imgWing,235,120)
	end
	if isSummerClear == true then
		love.graphics.draw(imgSStone,285,40)
		love.graphics.draw(imgHorse,285,120)
	end
	if isFallClear == true then
		love.graphics.draw(imgFStone,335,40)
		love.graphics.draw(imgEisen,335,120)
	end
	if isWinterClear == true then
		love.graphics.draw(imgWStone,385,40)
		love.graphics.draw(imgSword,385-1,120-1)
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
	if blacksmithCheck then
		if love.keyboard.isDown("escape") then
			blacksmithCheck = false
		end
	end
end
