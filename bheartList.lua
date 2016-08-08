bheartList = {}
bheartCount = 0

function CreateBheart(x,y)
  bheartList[bheartCount] = Bheart.create()
  bheartList[bheartCount]:reset(x,y)
  bheartCount = bheartCount + 1
end

function BheartListUpdate(dt)
  for i = 0, bheartCount-1 do
    bheartList[i]:update(dt)
  end
end

function BheartListDelete()
   for i=0, bheartCount-1 do
    bheartList[i]=nil
   end
   bheartCount=0
end

function BheartListDraw()
   for i=0, bheartCount-1 do
     bheartList[i]:draw(dt)
   end
end