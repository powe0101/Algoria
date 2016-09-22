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
