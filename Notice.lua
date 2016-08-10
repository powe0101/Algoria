-- Made : 2016/08/04 - G
-- Name : Notice.lua
-- notice = Notice.Create 
-- notice:SetText("STring")
-- 이미 main lua 에서 DrawNotice가 호출 되고 있기때문에 
-- 노티스가 띄워지고 싶은 부분에 상단 3,4번째 줄 코드만 기본적으로 추가하면 됨.
-- 색변화 또는 기타 옵션 부여는 메서드 참조
Notice = {}
Notice.__index = Notice

function Notice.Create()
	local self = {}
	setmetatable(self,Notice)
	
	self:reset()
	
	return self	
end

function Notice:reset() -- 초기값
	self.alpha = 0
	self.textColor = {255,255,255,255} --White RGB
	self.backGroundColor = {0,0,0,70} --Black RGB
	self.width = 365
	self.height = 48
	self.x = 0
	self.y = 0
	self.makeTime = love.timer.getTime() -- 노티스가 생성된 시간 
	self.reduceAlpha = 0.7 --alpha값의 변화량
	self.text = ""
end

function Notice:SetText(text)
	self.text = text
end

function Notice:SetPosition(x,y)
	self.x = x
	self.y = y
end

function Notice:SetSize(width,height)
	self.width = width
	self.height = height
end

function Notice:DrawBackGround()
	love.graphics.setColor(self.backGroundColor)
	love.graphics.rectangle("fill", 0,HEIGHT / 2 - 30, WIDTH,self.height)
	love.graphics.setColor(255,255,255)

	self.backGroundColor[4] = self.backGroundColor[4] - self.reduceAlpha
end


function Notice:DrawText()
	love.graphics.setColor(self.textColor)
	love.graphics.print(self.text,WIDTH / 2 - 20,HEIGHT / 2 - 15)
	love.graphics.setColor(255,255,255)

	self.textColor[4] = self.textColor[4] - self.reduceAlpha
end

function Notice:Draw()
	--노티스 그리기
	if love.timer.getTime() - 2 > self.makeTime then
		self:Delete()
		return 
	end

	self:DrawBackGround()
	self:DrawText()
end

function NoticeDraw()
	if notice then
		notice:Draw()
	end
end

function Notice:Delete()
	if self then 
		self = nil 
	end
end

function Notice:SetTextColor(red,green,blue)
	self.textColor[1] = r
	self.textColor[2] = g
	self.textColor[3] = b
end

function Notice:SetBackgroundColor(red,green,blue)
	self.backGroundColor[1] = red--노티스 배경 색 
	self.backGroundColor[2] = green
	self.backGroundColor[3] = blue
end

function Notice:SetBackGroundAlpha(alpha)
	self.backGroundColor[4] = alpha
end

function Notice:SetTextAlpha(alpha)
	self.textColor[4] = alpha
end