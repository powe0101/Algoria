local self={}
setmetatable(self,Control)

MOVE_POWER = 1
SJUMP_POWER = -40 --0808 근영 cloud가 플레이어 점프에 맞처서 이동 할대 쓰임 
SGRAVITY = -470 --0808 근영 cloud가 플레이어 점프에 맞처서 이동 할대 쓰임 
function BackgroundMove(_s,dt) --07 21 근영 key 입력 받았을시 
	self=_s --tree,cloud에서 self를 받는다 
		
   	if love.keyboard.isDown('right') and isCanMoveRight then
   		if pl:GetX()~=590 and pl:GetX()~=0 and pl:GetX() > 225 + BridegePassValue and stageLevel == 1 then --봄일 때.
   			-- 도개교가 열리기 전까지는 못움직이게 함. 이후 움직이게 하기 위해서는 TRUE/FALSE로 값을 조절해야 할 듯.
   			if canPass and pl:GetX()~=590 and pl:GetX()~=0 then -- 이 사이에 있는 부분을 메서드로 빼면 좋을 것 같은데 방법이 없나? 계속 터지네.. by.현식 0728
	 			   self.frame = (self.frame + 15*dt) % 3
	    	    	self.x = self.x - MOVE_POWER	
  			end -- canPass
    	elseif  pl:GetX()~=590 and pl:GetX()~=0 then
    		self.frame = (self.frame + 15*dt) % 3
	    	self.x = self.x - MOVE_POWER
     	end
   	end 
    
    if love.keyboard.isDown('left') and isCanMoveLeft then
    	if pl:GetX()~=590 and pl:GetX()~=0 and pl:GetX() < 290 - BridegePassValue and stageLevel == 3 then
   			-- 도개교가 열리기 전까지는 못움직이게 함. 이후 움직이게 하기 위해서는 TRUE/FALSE로 값을 조절해야 할 듯.
   			if canPass then -- 이 사이에 있는 부분을 메서드로 빼면 좋을 것 같은데 방법이 없나? 계속 터지네.. by.현식 0728
				  self.frame = (self.frame + 15*dt) % 3
    			self.x = self.x + MOVE_POWER	
  			end -- canPass
    	elseif pl:GetX()~=590 and pl:GetX()~=0 then
    		self.frame = (self.frame + 15*dt) % 3
    		self.x = self.x + MOVE_POWER
     	end
   	end 
	return self --다시 self를 tree cloud에게 return해준다 
end

function BackgroundNormal(_s,dt) --07 21 근영 background 이동 
	self=_s

  if self.status == 0 then -- normal ourside
    self.y = self.y - self.yspeed*dt
  
    if  pl:GetY() >350  then --원래 설정값은 150이었음. 공중에 떠있는 것 같아서 10늘림. by.현식
      self.y = self.yfix
      self.yspeed = 0
      self.onGround = true
    end
  end

  return self
end

function SCheckSpaceBarDown(_s,dt) --0808근영 여름 스테이지 점프 함수 
  self=_s
  if love.keyboard.isDown('space') then
    self.yspeed = SJUMP_POWER 
  end

  self.yspeed = self.yspeed + dt*SGRAVITY+13
  return self
end