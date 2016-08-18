Player = {}
Player.__index = Player

PLAYER_MOVE_POWER = 1-- 이 값을 바꾸면 전체적인 x좌표에도 영향을 주는듯? ex.포탈 by.현식 0727

PLAYER_WIDTH = 10
PLAYER_HEIGHT = 15
PLAYER_START_X = 50
PLAYER_START_Y = 100

player_frames_left = {}
player_frames_right = {}
summerPlayer_frames_left = {}
summerPlayer_frames_right = {}
fallPlayer_frames_left = {}
fallPlayer_frames_right = {}
winterPlayer_frames_left = {}
winterPlayer_frames_right = {}

isCanMoveLeft = true
isCanMoveRight = true
isCanJump = true

-- 플레이어의 왼쪽 오른쪽 상태 구분 변수, 오른쪽이 true
isPlayerRight = true

collision_Top_Y = 0
collision_Bottom_Y = 0

for i=0,2 do
	player_frames_left[i] = love.graphics.newQuad(32*i,0,32,32,96,64)
end
for i=0,2 do
	player_frames_right[i] = love.graphics.newQuad(32*i,32,32,32,96,64)
end
for i=0,2 do
	summerPlayer_frames_left[i] = love.graphics.newQuad(64*i,0,64,32,192,64)
end
for i=0,2 do
	summerPlayer_frames_right[i] = love.graphics.newQuad(64*i,32,64,32,192,64)
end
for i=0,2 do
	fallPlayer_frames_left[i] = love.graphics.newQuad(64*i,0,64,64,192,128)
end
for i=0,2 do
	fallPlayer_frames_right[i] = love.graphics.newQuad(64*i,64,64,64,192,128)
end
for i=0,2 do
	winterPlayer_frames_left[i] = love.graphics.newQuad(32*i,0,32,40,96,80)
end
for i=0,2 do
	winterPlayer_frames_right[i] = love.graphics.newQuad(32*i,40,32,40,96,80)
end

function Player.create()
	local self = {}
	setmetatable(self,Player)
	self:reset()
	return self
end

function Player:UpdateMoveRight(dt)
	self.frame = (self.frame + 15*dt) % 3
	if self.x < WIDTH - 10 and isCanMoveRight and stageLevel~=2  then
		self.x = self.x + PLAYER_MOVE_POWER
  elseif self.x < WIDTH - 10 and stageLevel==2  then --0812 여름 스테이지 일때 벽 통과
		self.x = self.x + PLAYER_MOVE_POWER
  end

	isPlayerRight = false
	if stageLevel == 1 then
		player_now_frame = player_frames_left[math.floor(self.frame)]
	elseif stageLevel == 2 then
		player_now_frame = summerPlayer_frames_left[math.floor(self.frame)]
	elseif stageLevel == 3 then
		player_now_frame = fallPlayer_frames_left[math.floor(self.frame)]
	elseif stageLevel == 4 then
		player_now_frame = winterPlayer_frames_left[math.floor(self.frame)]
	else
		player_now_frame = player_frames_left[math.floor(self.frame)]
	end
end
--Add by G 0729

function Player:UpdateMoveLeft(dt)
	self.frame = (self.frame + 15*dt) % 3
	if self.x > 0  and isCanMoveLeft and stageLevel~=2 then
		self.x = self.x - PLAYER_MOVE_POWER
	elseif self.x > 0 and stageLevel==2 then --0812 여름 스테이지 일때 벽 통과
		self.x = self.x - PLAYER_MOVE_POWER
	end

	isPlayerRight = true
	if stageLevel == 1 then
		player_now_frame = player_frames_right[math.floor(self.frame)]
	elseif stageLevel == 2 then
		player_now_frame = summerPlayer_frames_right[math.floor(self.frame)]
	elseif stageLevel == 3 then
		player_now_frame = fallPlayer_frames_right[math.floor(self.frame)]
	elseif stageLevel == 4 then
		player_now_frame = winterPlayer_frames_right[math.floor(self.frame)]
	else
		player_now_frame = player_frames_right[math.floor(self.frame)]
	end
end
--Add by G 0729

function Player:UpdateMove(dt)
	if love.keyboard.isDown('right') then --0805HS
		if self.x > 225 + BridegePassValue and stageLevel == 1 then --스테이지에서 도개교가 열리지 않는 한 넘어갈 수 없도록 함. by.현식 0727
			--앞으로 갈 수 없다는 어떤 액션을 취하면 좋을 듯. by.현식 0727
			if canPass then -- 이 사이에 있는 부분을 메서드로 빼면 좋을 것 같은데 방법이 없나? 계속 터지네.. by.현식 0728
				self:UpdateMoveRight(dt)
			end -- canPass
		else --마을일 경우.
			self:UpdateMoveRight(dt)
		end
	end

	if love.keyboard.isDown('left') then --0805HS
		if self.x < 460 - BridegePassValue and stageLevel == 3 then --가을은 오른쪽에서 시작해서 왼쪽으로 가는 방식임.
			if canPass then
				self:UpdateMoveLeft(dt)
			end
		else --마을일 경우
			self:UpdateMoveLeft(dt)
		end
	end

	if love.keyboard.isDown('space') then
		self.frame = (self.frame + 15*dt) % 3
		if stageLevel==2 and isPlayerRight == true then
			player_now_frame = summerPlayer_frames_right[math.floor(self.frame)]
		elseif stageLevel==2 and isPlayerRight == false then
			player_now_frame = summerPlayer_frames_left[math.floor(self.frame)]
		end
	end
end

--Add by G 0729
function Player:CheckSpaceBarDown(dt)
	if stageLevel~=2 then
		if love.keyboard.isDown('space') and self.onGround == true then
			self.yspeed = self.jump_power + collision_Bottom_Y
		end

		self.onGround = false
		self.yspeed = self.yspeed + dt*self.gravity
	elseif stageLevel==2 then
		if love.keyboard.isDown('space') and self.y>30 and self.y < 360 then
			self.yspeed = self.jump_power
		end

		self.onGround = false
		self.yspeed = self.yspeed + dt*self.gravity+13
	end
end

function Player:HitbyTrampolin(dt)
	if self.status == 1 then
		self.y = self.y + self.yspeed*dt
		self.x = self.x - dt*300
	end
	-- 45degree? 검증 필요
end

function Player:normal(dt)
	if self.status == 0 then -- normal ourside
		self.y = self.y + self.yspeed*dt
		if collision_Top_Y > 0 and self.y > collision_Top_Y - 10 and self.yspeed > 0 and stageLevel~=2 then
			if self.isTop then  -- on the box
				self.y = collision_Top_Y - 10
				self.yspeed = 0
				self.onGround = true
				return
			end
        elseif self.isTop and stageLevel==2  then
        	self.yspeed=0
        	return
		elseif self.y > self.player_ground_y then
		 --원래 설정값은 150이었음. 공중에 떠있는 것 같아서 10늘림. by.현식
			self.y = self.player_ground_y
			self.yspeed = 0
			self.onGround = true
		end
	end
end

function Player:FindPlayerPosWithBox()
	self:CollisionByBox()
	-- 상하좌우의 박스리스트에 있는 박스 각각 현재 위치와 플레이어 위치를 통한 일괄 판별

	self.isTop = FindCollisionTopDirection()
	self.isBottom = FindCollisionBottomDirection()
	isCanMoveRight = FindCollisionRightDirection()
	isCanMoveLeft = FindCollisionLeftDirection()
	-- 판별 된 박스 중에 True 에해당하는 값이 있는지 판별
	-- 여러개의 박스를 검사하기 위해 CollisionByBox 와 Direction을 나눔
end

function Player:update(dt)
	-- Update walk frame
	self:FindPlayerPosWithBox()	--박스 찾는 알고리즘
	self:CheckSpaceBarDown(dt)
	self:UpdateMove(dt)
	self:normal(dt)
	self:HitbyTrampolin(dt)
	if stageLevel==2 then -- 0811 근영 가시에 닿앗을때 점프
		self:SCheckHudle()
	end

	self:IfQuest() --퀘스트 만들기 전까지 임시 대용. by.현식 0802
end

function Player:reset()
	if stageLevel==2 then --stageLevel 이 2일때 설정 값
		self.jump_power = -40
		self.gravity = -470
		self.player_ground_y = 330
		self.y=300
	elseif stageLevel~=2 then--stageLevel 이 2가 아닐때 설정 값
		self.jump_power = -300
		self.gravity = 1000
		self.player_ground_y = 145
		self.y = PLAYER_START_Y
	end
	self.frame = 1
	self.x = PLAYER_START_X

	self.yspeed = 0
	self.onGround = true
	self.status = 0

	--캐릭터 수정
	self.width = 42
	self.pHeight = 42
	self.top = self.y - (self.pHeight * 2)
	self.left = self.x - (self.width * 2)
	self.right = self.x + (self.width * 2)
	self.bottom = self.y

	if stageLevel == 1 then
		playerCurrentImage = imgSpringChar
		player_now_frame = player_frames_left[0]
	elseif stageLevel == 2 then
		playerCurrentImage = imgSummerChar
		player_now_frame = summerPlayer_frames_left[0]
	elseif stageLevel == 3 then
		self.player_ground_y = 120
		playerCurrentImage = imgFallChar
		player_now_frame = fallPlayer_frames_right[0]
	elseif stageLevel == 4 then
		self.player_ground_y = 140
		playerCurrentImage = imgWinterChar
		player_now_frame = winterPlayer_frames_left[0]
	else
		playerCurrentImage = imgSprites
		player_now_frame = player_frames_left[0]
	end
end

function Player:draw()
	-- Update position
	love.graphics.draw(playerCurrentImage,player_now_frame,self.x,self.y)
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

function Player:SetY(_y)
	self.y=_y
end


function Player:GetIsTop()
	return self.isTop
end

function Player:GetOnGround()
	return self.onGround
end

--0805HS
function Player:StartSpringStage() --스테이지가 변경됐을 때 캐릭터 좌표를 초기화 시키기 위한 메서드. by.현식 0727
	self.x = PLAYER_START_X
	self.y = PLAYER_START_Y
end

--0805HS
function Player:StartSummerStage() --스테이지가 변경됐을 때 캐릭터 좌표를 초기화 시키기 위한 메서드. by.현식 0727
	self.x = 100
	self.y = 200
end

function Player:ResetCoord()
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
		h2= pl.pHeight

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

--0805HS
function Player:SUMMERSCRNHEIGHT() --스테이지가 변경됐을 때 캐릭터 좌표를 초기화 시키기 위한 메서드. by.현식 0727
	--self:SetLeftDirection()
	self.x = 520
	self.y = PLAYER_START_Y
end

function Player:StartFallStage()
	--self.x = 520 --WIDTH 수정하기 전 값.
	self.x = 560
	self.y = PLAYER_START_Y
end
--0805HS
function Player:StartWinterStage() --스테이지가 변경됐을 때 캐릭터 좌표를 초기화 시키기 위한 메서드. by.현식 0727
	self.x = PLAYER_START_X
	self.y = PLAYER_START_Y
end

--0805HS
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

function Player:SCheckHudle()-- 0811 근영 가시에 닿앗을때 점프
	if self.y==330 and checkPlaying then --0816 근영 퀘스트 다 완료 했을시 그만 멈추여야 함
		self.yspeed =-95
    	LifeMinus()
	end
end
