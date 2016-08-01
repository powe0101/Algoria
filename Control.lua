local self={}
setmetatable(self,Control)

MOVE_POWER = 1

function BackgroundMove(_s,dt) --07 21 근영 key 입력 받았을시 
	self=_s --tree,cloud에서 self를 받는다 
		
   	if love.keyboard.isDown('right')  then
   		if pl:GetX() > 225 + BridegePassValue and stageLevel == 3 then --스테이지에서 도개교가 열리지 않는 한 넘어갈 수 없도록 함. by.현식 0727
   			-- 도개교가 열리기 전까지는 못움직이게 함. 이후 움직이게 하기 위해서는 TRUE/FALSE로 값을 조절해야 할 듯.
   			if canPass then -- 이 사이에 있는 부분을 메서드로 빼면 좋을 것 같은데 방법이 없나? 계속 터지네.. by.현식 0728
				self.frame = (self.frame + 15*dt) % 3
	    		self.x = self.x - MOVE_POWER	
			end -- canPass
    	elseif isCanMove and  pl:GetX()~=590 and pl:GetX()~=0 then
    		self.frame = (self.frame + 15*dt) % 3
	    	self.x = self.x - MOVE_POWER
     	end
   	end 
    
    if love.keyboard.isDown('left')  then
    	if isCanMove and  pl:GetX()~=590 and pl:GetX()~=0 then
	    	self.frame = (self.frame + 15*dt) % 3
    		self.x = self.x + MOVE_POWER
      	end
   	end

	return self --다시 self를 tree cloud에게 return해준다 
end

function BackgroundNormal(_s,dt) --07 21 근영 background 이동 
	self=_s

	if self.status == 0 then -- normal ourside
		self.yspeed = 0
		self.onGround = true
	end
	
	return self
end