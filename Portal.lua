function CreatePortal(x, y)
	Portal = newAnimation(imgPortal,64,64,0.3,0)
	Portal:setMode("loop")
	Portal:SetAniPostion(x,y)
	Portal:play()
end

function PortalDraw()
	if Portal == nil then
		return 
	end
	Portal:draw()
end

function PortalUpdate(dt)
	Portal:update(dt)
end
