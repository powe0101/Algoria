Player = {}
Player.__index = Player

JUMP_POWER = -300
GRAVITY = 1000
PLAYER_MOVE_POWER = 1-- 이 값을 바꾸면 전체적인 x좌표에도 영향을 주는듯? ex.포탈 by.현식 0727

PLAYER_WIDTH = 10
PLAYER_HEIGHT = 15
PLAYER_START_X = 50
PLAYER_START_Y = 100

player_frames_left = {}
player_frames_right = {}

PLAYER_GROUND_Y = 135

isCanMoveLeft = true
isCanMoveRight = true

for i=0,2 do
	player_frames_left[i] = love.graphics.newQuad(42*i,42,42,42,128,170)
end

for i=0,2 do
	player_frames_right[i] = love.graphics.newQuad(42*i,84,42,42,128,170)
end

player_frames_stand = love.graphics.newQuad(42,0,42,42,128,170)
player_frames_jump = love.graphics.newQuad(42,128,42,42,128,170)

function Player.create()
	local self = {}
	setmetatable(self,Player)
	self:reset()
	return self
end


function Player:UpdateMoveRight(dt)
	self.frame = (self.frame + 15*dt) % 3
	if self.x < WIDTH - 10 and isCollision then
		self.x = self.x + PLAYER_MOVE_POWER
	end

	if love.keyboard.isDown('space') then
		player_now_frame = player_frames_jump
	else
		player_now_frame = player_frames_left[math.floor(self.frame)]
	end
end
--Add by G 0729

function Player:UpdateMoveLeft(dt)
	self.frame = (self.frame + 15*dt) % 3
	if self.x > 0  and isCollision then
		self.x = self.x - PLAYER_MOVE_POWER
	end

	if love.keyboard.isDown('space')  then
			player_now_frame = player_frames_jump
	else
			player_now_frame = player_frames_right[math.floor(self.frame)]
	end
end
--Add by G 0729

function Player:UpdateMove(dt)
		--Add by G 0729
	
	if love.keyboard.isDown('right') then
		if self.x > 225 and stageLevel > 0 then --스테이지에서 도개교가 열리지 않는 한 넘어갈 수 없도록 함. by.현식 0727
			--앞으로 갈 수 없다는 어떤 액션을 취하면 좋을 듯. by.현식 0727
		else
			self:UpdateMoveRight(dt)
		end
	end
	if love.keyboard.isDown('left') then
		self:UpdateMoveLeft(dt)
	end
end

function Player:CheckSpaceBarDown(dt)
	if love.keyboard.isDown('space') and self.onGround == true then
		self.yspeed = JUMP_POWER
	end

	self.onGround = false
	self.yspeed = self.yspeed + dt*GRAVITY
end

function Player:normal(dt)
	if self.status == 0 then -- normal ourside
		self.y = self.y + self.yspeed*dt
		if self.y > PLAYER_GROUND_Y then --원래 설정값은 150이었음. 공중에 떠있는 것 같아서 10늘림. by.현식
			self.y = PLAYER_GROUND_Y
			self.yspeed = 0
			self.onGround = true
		end
	end
end

function Player:update(dt)
	-- Update walk frame
	isCollision = self:CollisionByBox()
	self:CheckSpaceBarDown(dt)
	self:UpdateMove(dt)
	self:normal(dt)
end

function Player:reset()
	self.frame = 1
	self.x = PLAYER_START_X
	self.y = PLAYER_START_Y
	player_now_frame = player_frames_left[0]
	self.yspeed = 0
	self.onGround = true
	self.status = 0

	--캐릭터 수정
	self.width = 42
	self.height = 42
	self.top = self.y - (self.height * 2)
	self.left = self.x - (self.width * 2)
	self.right = self.x + (self.width * 2)
	self.bottom = self.y

end

function Player:draw()
	-- Update position
	love.graphics.draw(imgSprites,player_now_frame,self.x,self.y)
	if DEBUG_SETTING then
		love.graphics.rectangle("line",self.x+8,self.y,25,42)
	end
	-- Check keyboard input
end


function Player:GetX()
	return self.x
end

function Player:GetY()
	return self.y
end

function Player:GetOnGround()
	return self.onGround
end

function Player:SetStartPosition() --스테이지가 변경됐을 때 캐릭터 좌표를 초기화 시키기 위한 메서드. by.현식 0727
	self.x = PLAYER_START_X
	self.y = PLAYER_START_Y
end

function Player:CollisionByBox()
	for i = 0, boxCount-1 do
		isCollision = self:collideWithPoint(boxList[i]:GetX(),boxList[i]:GetY(),20,20,pl:GetX(),pl:GetY(),42,42)
		if isCollision then
			boxList[i].isCollision = true
		else
			boxList[i].isCollision = false
		end
	end
	return true
end

function Player:collideWithPoint(x1,y1,w1,h1, x2,y2,w2,h2)
	if x1 < x2+w2 and
    x2 < x1+w1 and
    y1 < y2+h2 and
    y2 < y1+h1 then 
    
    return false 
   
    else
    	return true
    end
end