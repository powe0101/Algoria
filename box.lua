Box = {}
Box.__index = Box

box_frame = love.graphics.newQuad(0, 0, 20, 20, 128, 128)

BOX_WIDTH = 20
BOX_HEIGHT = 20

collisionColor = {255,0,0}
global_isCollision = false


function Box:create()
	local self = {}
	setmetatable(self, Box)
	self:reset()
	self.dtBox = {}

	return self
end

function Box:reset(x,y)
	--0808 근영 yfix yspeed 추가 
	self.yfix=y
	self.yspeed = 0
	self.onGround = true
	self.status = 0
	self.frame = 1
	self.x = x
	self.y = y

	self.onGround = true
	self.isCollisionRight = false
	self.isCollisionLeft = false
	self.isCollisionTop = false
	self.isCollisionBottom = false
	--박스 크기
	self.width = 20
	self.height = 20

	--위치 조정
end

function Box:GetDT()
	return self.dtBox
end

function Box:CreateDirectionBox()
	--박스의 방향에 따른 감지 박스의 좌표값 기록
  self.dtBox[0] = self.x + BOX_WIDTH
  self.dtBox[1] = self.y
   --left

  self.dtBox[2] = self.x - BOX_WIDTH
  self.dtBox[3] = self.y
   --right

  self.dtBox[4] = self.x
  self.dtBox[5] = self.y + BOX_WIDTH
  	--bottom

  self.dtBox[6] = self.x
  self.dtBox[7] = self.y - BOX_WIDTH
 	--top

end

function Box:SpaceJump(dt) --0808근영 점프함수  
	self=SCheckSpaceBarDown(self,dt)
end

function Box:UpdateMove(dt) --tree key이벤트 
	self=BackgroundMove(self,dt)
  end

function Box:normal(dt) --cloud 이동 
	self=BackgroundNormal(self,dt)
end

function Box:update(dt)
	if stageLevel==2 then-- 0808근영 여름 스테이지 에서 점프함수 호출
		self:SpaceJump(dt)
	end
	self:UpdateMove(dt)
	self:normal(dt)
	self.x_distance = pl:GetX() - self:GetX()
	self.y_distance = pl:GetY() - self:GetY()
	--Debug
end



function Box:GetX()
	return self.x
end 

function Box:GetY()
	return self.y
end

function Box:DrawLine(_x,_y)
	love.graphics.setColor(0,255,0)
	love.graphics.rectangle('line', _x,_y, BOX_WIDTH, BOX_HEIGHT)
	love.graphics.setColor(255,255,255)
end

function Box:draw()
	love.graphics.setColor(255,255,255) -- 흰색 RGBA
  	love.graphics.rectangle('fill', self.x,self.y, BOX_WIDTH, BOX_HEIGHT)

  	if DEBUG_SETTING then 
 		drawDirectionBox(self,255,255,255)
 	end

 	if self.isCollisionRight then 
 		self:DrawLine(self.x + BOX_WIDTH, self.y)
 	end

 	if self.isCollisionLeft then 
 		self:DrawLine(self.x - BOX_WIDTH, self.y)
 	end

 	if self.isCollisionTop then 
 		self:DrawLine(self.x, self.y - BOX_WIDTH)
 	end

 	if self.isCollisionBottom then 
 		self:DrawLine(self.x, self.y + BOX_WIDTH)
 	end

 	love.graphics.setColor(255,255,255) -- 흰색 RGBA
end



function drawDirectionBox(box, r,g,b)
  love.graphics.setColor(r,g,b,70)
  love.graphics.rectangle("fill", box.x + BOX_WIDTH, box.y, BOX_WIDTH, BOX_HEIGHT)
  love.graphics.setColor(r,g,b)
  love.graphics.rectangle("line", box.x + BOX_WIDTH, box.y, BOX_WIDTH, BOX_HEIGHT)
  --right
  love.graphics.setColor(r,g,b,70)
  love.graphics.rectangle("fill", box.x - BOX_WIDTH, box.y, BOX_WIDTH, BOX_HEIGHT)
  love.graphics.setColor(r,g,b)
  love.graphics.rectangle("line", box.x - BOX_WIDTH, box.y, BOX_WIDTH, BOX_HEIGHT)
  --left
  love.graphics.setColor(r,g,b,70)
  love.graphics.rectangle("fill", box.x , box.y + BOX_WIDTH, BOX_WIDTH, BOX_HEIGHT)
  love.graphics.setColor(r,g,b)
  love.graphics.rectangle("line", box.x , box.y + BOX_WIDTH , BOX_WIDTH, BOX_HEIGHT)
  --bottom

  love.graphics.setColor(r,g,b,70)
  love.graphics.rectangle("fill", box.x, box.y - BOX_WIDTH, BOX_WIDTH, BOX_HEIGHT)
  love.graphics.setColor(r,g,b)
  love.graphics.rectangle("line", box.x, box.y - BOX_WIDTH, BOX_WIDTH, BOX_HEIGHT)
  --top
	love.graphics.setColor(darkcolor) -- 흰색 RGBA
-- 	love.graphics.rectangle('fill', self:GetX(), self:GetY(), BOX_WIDTH, BOX_HEIGHT)
end