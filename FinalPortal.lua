function CreateFinalPortal(x, y)
	FPortal = newAnimation(imgFPortal,64,64,0.3,0)
	FPortal:setMode("loop")
	FPortal:SetAniPostion(x,y)
	FPortal:play()
end

function FinalPortalDraw()
	if FPortal == nil then
		return
	end
	FPortal:draw()
end

function FinalPortalUpdate(dt)
	FPortal:update(dt)
end
