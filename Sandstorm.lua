function CreateSandStorm(x, y)
	SandStorm = newAnimation(imgSandStorm,128,192,0.3,0)
	SandStorm:setMode("loop")
	SandStorm:SetAniPostion(x,y)
	SandStorm:play()
end

function SandStormDraw()
	SandStorm:draw()
end

function SandStormUpdate(dt)
	SandStorm:update(dt)
end
