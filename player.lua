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

for i=0,2 do
	player_frames_left[i] = love.graphics.newQuad(42*i,42,42,42,128,170)
end

for i=0,2 do
	player_frames_right[i] = love.graphics.newQuad(42*i,84,42,42,128,170)
end

function Player.create()
	local self = {}
	setmetatable(self,Player)
	self:reset()
	return self
end

function Player:UpdateMove(dt)
	if love.keyboard.isDown('right') then
		if self.x > 289 and startStage > 0 then --스테이지에서 도개교가 열리지 않는 한 넘어갈 수 없도록 함. by.현식 0727
			--앞으로 갈 수 없다는 어떤 액션을 취하면 좋을 듯. by.현식 0727
		else
			self.frame = (self.frame + 15*dt) % 3
			if self.x < WIDTH - 10 then
				if isCanMove then
					self.x = self.x + PLAYER_MOVE_POWER
				end
			end
			player_now_frame = player_frames_left[math.floor(self.frame)]
		end
	end

	if love.keyboard.isDown('left') then
		self.frame = (self.frame + 15*dt) % 3
			if self.x > 0 then
				if isCanMove then
					self.x = self.x - PLAYER_MOVE_POWER
				end
			end
		player_now_frame = player_frames_right[math.floor(self.frame)]
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
		if self.y > 135 then --원래 설정값은 150이었음. 공중에 떠있는 것 같아서 10늘림. by.현식
			self.y = 135
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