function CreatePortal(x, y)
	Portal = newAnimation(imgPortal,64,64,0.3,0)
	Portal:setMode("loop")
	Portal:CreateObject(x,y)
	Portal:play()
end

function PortalDraw()
	Portal:draw()
end

function PortalUpdate(dt)
	Portal:update(dt)
end