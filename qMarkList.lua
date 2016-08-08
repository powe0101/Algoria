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
  if qmarkCheck then
      if phase == 2 then
          QMarkListDelete()
          CreateQMark(292, 115)
          qmarkCheck = false
      elseif phase== 3 then
          QMarkListDelete()
          CreateQMark(217, 115)
          qmarkCheck = false
      elseif phase == 4 then
          QMarkListDelete()
          qmarkCheck = false
      end
  end
end