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

PLAYER_GROUND_Y = 145

isCanMoveLeft = true
isCanMoveRight = true
isCanJump = true

collision_Top_Y = 0
collision_Bottom_Y = 0

for i=0,2 do
	player_frames_left[i] = love.graphics.newQuad(32*i,0,32,32,96,64)
end

for i=0,2 do
	player_frames_right[i] = love.graphics.newQuad(32*i,32,32,32,96,64)
end

function Player.create()
	local self = {}
	setmetatable(self,Player)
	self:reset()
	return self
end


function Player:UpdateMoveRight(dt)
	FindCollisionRightDirection()
	self.frame = (self.frame + 15*dt) % 3
	if self.x < WIDTH - 10 and isCanMoveRight then
		self.x = self.x + PLAYER_MOVE_POWER
	end
	player_now_frame = player_frames_left[math.floor(self.frame)]
end
--Add by G 0729

function Player:UpdateMoveLeft(dt)
	FindCollisionLeftDirection()
	self.frame = (self.frame + 15*dt) % 3
	if self.x > 0  and isCanMoveLeft then
		self.x = self.x - PLAYER_MOVE_POWER
	end

	if love.keyboard.isDown('space')  then
			player_now_frame = player_frames_jump
	else
			player_now_frame = player_frames_right[math.floor(self.frame)]
	end
	player_now_frame = player_frames_right[math.floor(self.frame)]
end
--Add by G 0729

function Player:UpdateMove(dt)
		--Add by G 0729
	
	if love.keyboard.isDown('right') then
		if self.x > 225 + BridegePassValue and stageLevel > 0 then --스테이지에서 도개교가 열리지 않는 한 넘어갈 수 없도록 함. by.현식 0727
			--앞으로 갈 수 없다는 어떤 액션을 취하면 좋을 듯. by.현식 0727
			if canPass then -- 이 사이에 있는 부분을 메서드로 빼면 좋을 것 같은데 방법이 없나? 계속 터지네.. by.현식 0728
				self:UpdateMoveRight(dt)		
			end -- canPass
		else
			self:UpdateMoveRight(dt)
		end
	end

	if love.keyboard.isDown('left') then
		self:UpdateMoveLeft(dt)
	end
end

function Player:CheckSpaceBarDown(dt)
	FindCollisionBottomDirection()
	if love.keyboard.isDown('space') and self.onGround == true then
		self.yspeed = JUMP_POWER + collision_Bottom_Y
	end

	self.onGround = false
	self.yspeed = self.yspeed + dt*GRAVITY
end

function Player:normal(dt)
	if self.status == 0 then -- normal ourside
		self.y = self.y + self.yspeed*dt
		if collision_Top_Y > 0 and self.yspeed > 0 then
			if self.isTop then 
				self.y = collision_Top_Y - 10
				self.yspeed = 0
				self.onGround = true
			end
		elseif self.y > PLAYER_GROUND_Y then --원래 설정값은 150이었음. 공중에 떠있는 것 같아서 10늘림. by.현식
			self.y = PLAYER_GROUND_Y
			self.yspeed = 0
			self.onGround = true
		end
	end
end

function Player:update(dt)
	-- Update walk frame
	self.isTop = FindCollisionTopDirection()
	self.isBottom = FindCollisionBottomDirection()
	self:CheckSpaceBarDown(dt)
	self:UpdateMove(dt)
	self:normal(dt)
	self:CollisionByBox()

	self:IfQuest() --퀘스트 만들기 전까지 임시 대용. by.현식 0802
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
	for i = 0 , boxCount - 1 do 
		boxList[i].isCollisionRight = 
		self:collideWithPoint(boxList[i]:GetX()+BOX_WIDTH,boxList[i]:GetY(),self)
		
		boxList[i].isCollisionLeft =
		self:collideWithPoint(boxList[i]:GetX() - BOX_WIDTH,boxList[i]:GetY(),self)

		boxList[i].isCollisionBottom = 
		self:collideWithPoint(boxList[i]:GetX(),boxList[i]:GetY() + BOX_WIDTH,self)

		boxList[i].isCollisionTop =
		self:collideWithPoint(boxList[i]:GetX(),boxList[i]:GetY() - BOX_WIDTH,self)

	end
end

function Player:collideWithPoint(x,y,_player)
		x1 = x
		y1 = y
		
		w1 = BOX_WIDTH 
		h1 = BOX_HEIGHT

		x2 = pl:GetX()
		y2 = pl:GetY() 
		w2 = pl.width
		h2= pl.height

		 if x1 + 25 > x2 + w2 or -- 플레이어 기준 왼쪽 
       	y1 > y2 + h2 or -- 플레이어가 박스 위에 있으면 
       	x2 + 25 > x1 + w1 or -- 오른쪽
       	y2 > y1 + h1   --플레이어 기준으로 플레이어가 박스 밑에 있으면 
    	then
        	return false                -- 충돌 안함
   		else
       		 return true                 -- 충돌
   		end
end

function Player:IfQuest()
	if love.keyboard.isDown('9') then
		if stageLevel > 0 then
			if BridegePassValue >= 90 then --3문제를 모두 풀었을 경우 완전히 다리를 넘아갈 수 있도록.
				canPass = true
			else --문제를 풀때마다 수치가 조금씩 증가함. 30씩 증가하면 됨.
				BridegePassValue = BridegePassValue + 10
			end
		end
	end
end