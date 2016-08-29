qmarkList = {}
qmarkCount = 0

qmarkCheck = false --문제를 풀때마다 느낌표가 뜨는 위치를 바꾸기 위한 bool형 변수.

function CreateQMark(x,y)
  qmarkList[qmarkCount] = QMark.create()
  qmarkList[qmarkCount]:reset(x,y)
  qmarkCount = qmarkCount + 1
end

function QMarkListUpdate(dt)
  for i = 0, qmarkCount-1 do
    qmarkList[i]:update(dt)
  end
end

function QMarkListDelete()
   for i=0, qmarkCount-1 do
    qmarkList[i]=nil
   end
   qmarkCount=0
end

function QMarkListDraw()
   for i=0, qmarkCount-1 do
     qmarkList[i]:draw(dt)
   end
end

function CheckQMark()
  if qmarkCheck  then --가을용
      if phase == 2 then
          QMarkListDelete()
          CreateQMark(picketList[1].x, picketList[1].y-30) --좌표가 자꾸 어긋남. 미치겠네
          qmarkCheck = false
      elseif phase== 3 then
          QMarkListDelete()
          CreateQMark(picketList[2].x, picketList[2].y-30)
          qmarkCheck = false
      elseif phase == 4 then
          QMarkListDelete()
          qmarkCheck = false
      end
  end
end