bridgeList = {}
bridgeCount = 0

--Create는 Bridge에서 함.

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
     bridgeList[i]:draw()
   end
end

function CheckBridegeAniPassValue()--by.근영 0802  다리의 애니메이션 언제 시작 할 것인지 조건 함수  
  if 0 < BridegePassValue and BridegePassValue < 186 then --첫번째 문제를 출었다고 가정 
    bridgeList[0]:play()
    bridgeList[1]:play()--두번째 문제를 풀었다고 가정
  elseif BridegePassValue >= 186 and not canPass then
    bridgeList[2]:play()
    bridgeList[3]:play()
  end
    
  if canPass then --문제를 다 풀었을 때 마지막 다리가 올라옴
    bridgeList[4]:play()
    bridgeList[5]:play()
  end
end