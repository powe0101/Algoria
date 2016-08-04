Notice = {}
Notice.__index = {}

function Notice.Create(_text,_x,_y)
	local self = {}
	setmetatable(self,Notice)
	self:SetText(_text)
	self:SetPosition(_x,_y)
	return self	
end

function Notice:SetText(_text)
	self.text = _text
end

function Notice:SetPosition(_x,_y)

end

function Notice:Draw()

end

function Notice:Delete()

end

function Notice:SetTextColor()

end

function Notice:SetBackgroundColor()

end

function Notice:SetBackgroundAlpha()

end


