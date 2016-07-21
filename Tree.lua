Tree = {}
Tree.__index = Tree

tree_frames_x = {}
tree_frames_y = {}
tree_frames_x[0]  = love.graphics.newQuad(0,0,108,212,128,128)
tree_frames_y[0] = love.graphics.newQuad(0,0,108,212,128,128)

function Tree.create()
	local self = {}
	setmetatable(self, Tree)
	self:reset()
	return self
end

function Tree:reset(x,y)
	self.frame = 1
	self.x = x
	self.y = y
	self.onGround = true
	self.yspeed = 0
	self.onGround = true
	self.status = 0
	tree_now_frame = tree_frames_x[0]
end

function Tree:normal(dt)  --tree 이동 
	self=BackgroundNomal(self,dt)
end

function Tree:UpdateMove(dt) --tree key이벤트 
	self=BackgroundMove(self,dt)
  end

function Tree:update(dt)
	self:UpdateMove(dt)
	self:normal(dt)
end

function Tree:draw()
	love.graphics.draw(imgTree,tree_frames_x[0],self.x,self.y)
end

function Tree:GetX()
	return self.x
end

function Tree:GetY()
	return self.y
end