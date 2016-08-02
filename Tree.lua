Tree = {}
Tree.__index = Tree

tree_frames_x = {}
tree_frames_y = {}
tree_frames_x[0]  = love.graphics.newQuad(0,0,108,212,120,128)
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
	tree_now_frame = tree_frames_x[0]
end

function Tree:normal(dt)  --tree 이동 
	self=BackgroundNormal(self,dt)
end

function Tree:UpdateMove(dt) --tree key이벤트 
	self=BackgroundMove(self,dt)
end

function Tree:update(dt)
	self:UpdateMove(dt)
	self:normal(dt)
end

function Tree:draw()
	--나무가 생성될 때 계절,스테이지에 따라 다르게 생성되게끔 만듬. by.현식
	if stageLevel == 0 then
		love.graphics.draw(imgTree,tree_frames_x[0],self.x,self.y)
	elseif stageLevel == 2 then 
		love.graphics.draw(imgSTree,tree_frames_x[0],self.x,self.y)
	elseif stageLevel == 3 then --가을입니다. by.현식
		love.graphics.draw(imgFTree,tree_frames_x[0],self.x,self.y)
	elseif stageLevel == 4 then
		love.graphics.draw(imgWTree,tree_frames_x[0],self.x,self.y)
	end
end

function Tree:GetX()
	return self.x
end

function Tree:GetY()
	return self.y
end