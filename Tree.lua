Tree = {}
Tree.__index = Tree

tree_frames_x = {}
tree_frames_y = {}
tree_frames_x[0]  = love.graphics.newQuad(0,0,64,100,64,100)
tree_frames_y[0] = love.graphics.newQuad(0,0,108,212,128,128)


function Tree.create()
	local self = {}
	setmetatable(self, Tree)
	self:reset()
	return self
end

function Tree:reset(x,y)
	self.yfix=y
	self.yspeed = 0
	self.onGround = true
	self.status = 0
	self.frame = 1
	self.x = x
	self.y = y
	tree_now_frame = tree_frames_x[0]
end

function Tree:SpaceJump(dt) --0808근영 점프함수
	self=SCheckSpaceBarDown(self,dt)
end

function Tree:normal(dt)  --tree 이동
	self=BackgroundNormal(self,dt)
end

function Tree:UpdateMove(dt) --tree key이벤트
	self=BackgroundMove(self,dt)
end

function Tree:update(dt)
	if stageLevel==2 then -- 0808근영 여름 스테이지 에서 점프함수 호출
		self:SpaceJump(dt)
	end
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
		fall_tree_frame = love.graphics.newQuad(0,0,120,120,120,120)
		love.graphics.draw(imgFTree,fall_tree_frame,self.x,self.y)
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
