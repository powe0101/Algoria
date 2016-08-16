function CreateCreeper(x, y)
  Creeper = newAnimation(imgCreeperFire,640,120,0.6,0)
  Creeper:setMode("once")
  Creeper:SetAniPostion(x,y)


  creeperList[creeperCount] = Creeper
  creeperCount = creeperCount + 1
end

function CreeperDraw()
  Creeper:draw()
end

function CreeperUpdate(dt)
  Creeper:update(dt)
end