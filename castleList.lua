castleList = {}
castleCount = 0

function CreateCastle(x,y)
	castleList[castleCount] = Castle.create()
	castleList[castleCount]:reset(x,y)
	castleCount = castleCount + 1
end

function CastleListUpdate(dt)
	for i = 0, castleCount-1 do
    castleList[i]:update(dt)
  end
end

function CastleListDelete()
   for i=0, castleCount-1 do
   castleList[i]=nil
   end
   castleCount=0
end

function CastleListDraw()
   for i=0, castleCount-1 do
     castleList[i]:draw(dt)
   end
end