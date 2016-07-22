Player = {}
Player.__index = Player

JUMP_POWER = -300
GRAVITY = 1000
PLAYER_MOVE_POWER = 1--테스트 by.현식

PLAYER_WIDTH = 10
PLAYER_HEIGHT = 15
PLAYER_START_X = 50
PLAYER_START_Y = 100

player_frames_x = {}
player_frames_y = {}

for i=0,2 do
	player_frames_x[i] = love.graphics.newQuad(42*i,42,42,42,128,170)
end

for i=0,2 do
	player_frames_y[i] = love.graphics.newQuad(42*i,84,42,42,128,170)
end

function Player.create()
	local self = {}
	setmetatable(self,Player)
	self:reset()
	return self
end

function Player:UpdateMove(dt)
	if love.keyboard.isDown('right') then
		self.frame = (self.frame + 15*dt) % 3
		if self.x < WIDTH - 10 then
			if isCanMove then
				self.x = self.x + PLAYER_MOVE_POWER
				
			end
		end
		player_now_frame = player_frames_x[math.floor(self.frame)]
	end

	if love.keyboard.isDown('left') then
		self.frame = (self.frame + 15*dt) % 3
			if self.x > 0 then
				if isCanMove then
					self.x = self.x - PLAYER_MOVE_POWER
				end
			end
		player_now_frame = player_frames_y[math.floor(self.frame)]
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
	player_now_frame = player_frames_x[0]
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

