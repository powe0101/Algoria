QMark = {}
QMark.__index = QMark

QMark_frames_x  = love.graphics.newQuad(0,0,32,32,32,32)

function QMark.create()
	local self = {}
	setmetatable(self, QMark)
	self:reset()	
	return self
end

function QMark:reset(x,y)
	self.frame = 1
	self.x = x
	self.y = y

	self.onQMark = true
	QMark_now_frame = QMark_frames_x
end

function QMark:normal(dt) --QMark 이동 
	self=BackgroundNormal(self,dt)
end

function QMark:UpdateMove(dt) --QMark key이벤트 
	self=BackgroundMove(self,dt)
end

function QMark:update(dt)
	self:UpdateMove(dt)
	self:normal(dt)
end

function QMark:draw()
	love.graphics.draw(imgQMark,QMark_now_frame,self.x,self.y)
end