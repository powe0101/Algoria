bossList = {}
bossCount = 0

function CreateBoss(x,y)
	bossList[bossCount] = Boss.create()
	bossList[bossCount]:reset(x,y)
	bossCount = bossCount + 1
end

function BossListUpdate(dt)
	for i = 0, bossCount-1 do
    bossList[i]:update(dt)
  end
end

function BossListDelete()
   for i=0, bossCount-1 do
   bossList[i]=nil
   end
   bossCount=0
end

function BossListDraw()
   for i=0, bossCount-1 do
     bossList[i]:draw()
   end
end