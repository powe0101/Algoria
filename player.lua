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
	self.frame = (self.frame + 15*dt) % 3
	if self.x < WIDTH - 10 then
		if isCanMove then
			self.x = self.x + PLAYER_MOVE_POWER
		end
	end
	player_now_frame = player_frames_left[math.floor(self.frame)]
end
--Add by G 0729

function Player:UpdateMoveLeft(dt)
	self.frame = (self.frame + 15*dt) % 3
	if self.x > 0 then
		if isCanMove then
			self.x = self.x - PLAYER_MOVE_POWER
		end
	end
	player_now_frame = player_frames_right[math.floor(self.frame)]
end
--Add by G 0729

function Player:UpdateMove(dt)
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
	self:CheckSpaceBarDown(dt)
	self:UpdateMove(dt)
	self:normal(dt)
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
end

function Player:draw()
	-- Update position
	love.graphics.draw(imgSprites,player_now_frame,self.x,self.y)
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