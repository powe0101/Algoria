creeperList = {}
creeperCount = 0

--Create는 Bridge에서 함.

function CreeperListUpdate(dt)
 
  for i = 0, creeperCount-1 do
    creeperList[i]:update(dt)
  end

end

function CreeperListDelete()
   for i=0, creeperCount-1 do
    creeperList[i]=nil
   end
   creeperCount=0
end

function CreeperListDraw()
   for i=0, creeperCount-1 do
     creeperList[i]:draw()
   end
end

function CheckCreeperAniPassValue()--by.근영 0802  다리의 애니메이션 언제 시작 할 것인지 조건 함수  
  if canPass then -- 문제를 풀었다고 가정 
      groundList[0]:SetY(840) -- ground의 y 값을 변경 
      groundList[1]:SetY(840)
    creeperList[0]:play()
    creeperList[1]:play()
    pl.player_ground_y = 340

  end

end