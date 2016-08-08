-- Made : 2016/08/04 - G
-- Name : Notice.lua

Notice = {}
Notice.__index = Notice

function Notice.Create(_text,_x,_y)
	local self = {}
	setmetatable(self,Notice)
	
	self:reset()
	self:SetText(_text)
	self:SetPosition(_x,_y)
	
	return self	
end

function Notice:reset() -- 초기값
	self.alpha = 1
	self.textColor = {255,255,255,self.Alpha} --White RGB
	self.backGroundColor = {0,0,0,self.Alpha} --Black RGB
	self.width = 365
	self.height = 48
	self.x = 0
	self.y = 0
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

function Notice:Draw()
	--노티스 그리기 
end

function Notice:Delete()
	--노티스 삭제 (필요 없을 수도 있음 )
end

function Notice:SetTextColor(r,g,b)
	self.textColor = {r,g,b}--노티스 텍스트 색 
end

function Notice:SetBackgroundColor(r,g,b)
	self.backGroundColor = {r,g,b}--노티스 배경 색 
end

function Notice:SetBackgroundAlpha(_alpha)
	self.alpha = _alpha--노티스 투명도
end