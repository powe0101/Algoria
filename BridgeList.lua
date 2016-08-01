bridgeList = {}
bridgeCount = 0

function CreateBridge(x,y)
  bridgeList[bridgeCount] = Bridge.create()
  bridgeList[bridgeCount]:reset(x,y)
  bridgeCount = bridgeCount + 1
end

function BridgeListUpdate(dt)
  for i = 0, bridgeCount-1 do
    bridgeList[i]:update(dt)
  end
end

function BridgeListDelete()
   for i=0, bridgeCount-1 do
    bridgeList[i]=nil
   end
   bridgeCount=0
end

function BridgeListDraw()
   for i=0, bridgeCount-1 do
     bridgeList[i]:draw(dt)
   end
end