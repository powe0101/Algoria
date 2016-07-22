local self={}
setmetatable(self,Control)

MOVE_POWER = 1

function BackgroundMove(_s,dt) --07 21 근영 key 입력 받았을시 
	self=_s --tree,cloud에서 self를 받는다 
	if love.keyboard.isDown('right')  then
		if isCanMove and  pl:GetX()~=590 and pl:GetX()~=0 then
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

function BackgroundNomal(_s,dt) --07 21 근영 background 이동 
self=_s
if self.status == 0 then -- normal ourside
		self.y = self.y + self.yspeed*dt
		if self.y > 150 then
			self.y = 150
			self.yspeed = 0
			self.onGround = true
		end
	end
return self
end