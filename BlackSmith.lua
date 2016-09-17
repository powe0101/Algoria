BlackSmith = {}
BlackSmith.__index = BlackSmith

blacksmith_frames = {}
blacksmith_frames[0] = love.graphics.newQuad(0,0,50,40,50,40)

BlacksmithTalkList = {}
blacksmithTalkCheck = false

firstTalkWithBlacksmith = false --마을로 돌아올 때마다 true로 해줄 것.

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

function InitBlacksmithTalkList()
	BlacksmithTalkList = {AfterSpringTalk, AfterSummerTalk, AfterFallTalk, AfterWinterTalk}
end

function TalkWithBlacksmith()
	if blacksmithTalkCheck and stageLevel == 0 and clearLevel > 1 then	
	  BlackSmithTalkBackground()
	  love.graphics.setColor(0,0,0,255)
	  BlacksmithTalkList[clearLevel-1]()
	end
	love.graphics.setColor(255,255,255,255)
end

function AfterSpringTalk()
 	love.graphics.print("돌아왔구나 알!", 355, 26)
 	love.graphics.print("때마침 다음 성에서 사용할", 355, 46) 	
 	love.graphics.print("날개가 완성됐단다!", 355, 66)
 	love.graphics.print("다음 성에서는 구름 사이를", 390, 66)
 	love.graphics.print("날아다녀야 한다고 하는구나!", 355, 86)
 	love.graphics.print("조심히 다녀오렴!", 355, 106)
end

function AfterSummerTalk()
 	love.graphics.print("여름 클리어 후", 355, 26)
end

function AfterFallTalk()
 	love.graphics.print("가을 클리어 후", 355, 26)
end

function AfterWinterTalk()
 	love.graphics.print("겨울 클리어 후", 355, 26)
end