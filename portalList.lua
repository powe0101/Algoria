portalList = {}
portalCount = 0

function CreatePortal(x,y)
  portalList[portalCount] = Portal.create()
  portalList[portalCount]:reset(x,y)
  portalCount = portalCount + 1
end

function PortalListUpdate(dt)
  for i = 0, portalCount-1 do
    portalList[i]:update(dt)
  end
end

function DeletePortal()--07 21 근영 구름 초기화
   for i=0, portalCount-1 do
    portalList[i]=nil
   end
   portalCount=0
end

function PortalListDraw()
   for i=0, portalCount-1 do
     portalList[i]:draw(dt)
   end
end