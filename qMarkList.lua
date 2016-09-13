qmarkList = {}
qmarkCount = 0

qmarkCheck = false --문제를 풀때마다 느낌표가 뜨는 위치를 바꾸기 위한 bool형 변수.
qmarkCheckAtVillage = false

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

function CheckQmarkAtViilage()
  if qmarkCheckAtVillage and stageLevel == 0 then --마을, 튜토리얼용
      if tutorialProgressLevel == 2 then --용사 집 위에 느낌표
          QMarkListDelete()
          CreateQMark(houseList[0].x+50, 115)
          qmarkCheck = false
      elseif tutorialProgressLevel == 3 then --포탈 위에 느낌표
          QMarkListDelete()
          CreateQMark(Portal.x+15, Portal.y-35) --180
          qmarkCheck = false
      elseif tutorialProgressLevel == 4 then --대장장이 위에 느낌표
          QMarkListDelete()
          CreateQMark(blacksmithChar.x+12, 110)
          qmarkCheck = false
      elseif tutorialProgressLevel == 5 then --다시 장로 위에 느낌표
        QMarkListDelete()
        CreateQMark(chiefChar.x, 115)
        qmarkCheck = false
      else
        QMarkListDelete()
        qmarkCheck = false
      end
  end
end

function CheckBlacksmithTalkAndQmark()
  if firstTalkWithBlacksmith and stageLevel == 0 then
        CreateQMark(blacksmithChar.x+12, 110)
  end
end