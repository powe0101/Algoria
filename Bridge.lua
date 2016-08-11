function CreateBridge(x, y)
  Bridge = newAnimation(imgBridge,75,75,0.1,0)
  Bridge:setMode("once")
  Bridge:CreateObject(x,y)

  --생성하면서 동시에 리스트에 추가.
  bridgeList[bridgeCount] = Bridge
  bridgeCount = bridgeCount + 1
end

function BridgeDraw()
  Bridge:draw()
end

function BridgeUpdate(dt)
  Bridge:update(dt)
end