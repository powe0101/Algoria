-- Made : 2016/08/04 - G
-- Name : Notice.lua

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
	self.time = love.timer.getTime() -- 보여지는 시간
end

function Notice:SetText(_text)
	self.text = _text
end

function Notice:SetPosition(_x,_y)
	self.x = _x
	self.y = _y
end

function Notice:SetSize(_width,_height)
	self.width = _width
	self.height = _height
end

function Notice:DrawBackGround()
	love.graphics.setColor(self.backGroundColor)

	love.graphics.rectangle("fill", 0,HEIGHT / 2 - 30, WIDTH,self.height)
	
	love.graphics.setColor(255,255,255)

	self.backGroundColor[4] = self.backGroundColor[4] - 0.7
end


function Notice:DrawText()
	love.graphics.setColor(self.textColor)
	love.graphics.print(self.text,WIDTH / 2 - 20,HEIGHT / 2 - 15)
	love.graphics.setColor(255,255,255)
end

function Notice:Draw()
	--노티스 그리기
	if love.timer.getTime() - 2 > self.time then
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