River = {}
River.__index = River

River_frames_x  = love.graphics.newQuad(0,0,300,50,256,80) -- => 이거 움짤로 만들면 리스트로 관리해야함.

function River.create()
	local self = {}
	setmetatable(self, River)
	self:reset()	
	return self
end

function River:reset(x,y)
	self.frame = 1
	self.x = x
	self.y = y

	self.onRiver = true
	River_now_frame = River_frames_x
end

function River:normal(dt) --River 이동 
	self=BackgroundNormal(self,dt)
end

function River:UpdateMove(dt) --River key이벤트 
	self=BackgroundMove(self,dt)
end

function River:update(dt)
	self:UpdateMove(dt)
	self:normal(dt)
end

function River:draw()
	love.graphics.draw(imgRiver,River_now_frame,self.x,self.y)
end