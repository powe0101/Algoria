seasonList = {"봄", "여름", "가을", "겨울"}

function CheckPortal() --0725 마을에서 포탈같이 일정 좌표에서 ↑키를 누르면 장소가 이동되도록 해봄. by.현식
  -- body
  if love.keyboard.isDown('up') then --마을에서 스테이지로 넘어갈 때, 좌표값 뿐만 아니라 스테이지레벨도 같이 조건을 줘야할 듯. by.현식 0727
    if portalBlock and pl and 170 < pl:GetX() and pl:GetX() < 190 and stageLevel == 0 then --0722 스테이지 변경을 위한 테스트 진행중.. by.현식
      CheckPopup()
    elseif portalBlock == false and pl and 170 < pl:GetX() and pl:GetX() < 190 and stageLevel == 0 then 
      -- 마을에 아직 할 일이 남아서 못 가게 막음.
      needOverwork = true
    end
  end
end

function CheckPopup() --팝업창을 띄우고 메인 update를 멈추기 위해서 bool 변수를 사용함.
  popupCheck = true
end

function MoveNextStage()
  stageLevel = clearLevel
  if clearLevel == 1 then --마을에서 봄으로
    CreateSpring()
  elseif clearLevel == 2 then --마을에서 여름으로
    CreateSummer()
  elseif clearLevel == 3 then --마을에서 가을로
    CreateFall()
  elseif clearLevel == 4 then --마을에서 겨울로
    CreateWinter()
  else --최종 마왕으로.
  end
end

function ControlPopup() 
  if popupCheck and portalAdmin == false then
    --관리자 모드가 아닐 경우,..
    if love.keyboard.isDown("return") then --enter키임
      --임시 테스트용. 클리어가 가능한 스테이지가 가을밖에 없어서. 나중에 지울것.

      -- if clearLevel < 4 then
      --   clearLevel = 3
      -- end
      DeleteStage()
      MoveNextStage()
      popupCheck = false
    end

    if love.keyboard.isDown("escape") then -- esc누르면 아무일도 일어나지 않고 팝업창이 닫히게끔.
      selectCheck = 1
      popupCheck = false
    end
  end

  if needOverwork then
    if love.keyboard.isDown('return') then
      needOverwork = false
    end
  end
end

--------------이하 Draw부분.

function DrawNextStage()
  love.graphics.setColor(0,0,0,255) -- 검은색 RGBA
  DrawRectangle(80, 5, 110, 57)
  love.graphics.setColor(255,255,255,255)
  love.graphics.rectangle("fill", 162, 12, 216, 110)

  love.graphics.setColor(0,0,0,255) -- 검은색 RGBA
  love.graphics.print(seasonList[clearLevel].." 스테이지로 이동하시겠습니까?", 170, 25)

  love.graphics.print("이동하시려면 'enter'키를 눌러주세요.",168, 90)
end

function NeedOverworkAtVillage()
  love.graphics.setColor(0,0,0,255) -- 검은색 RGBA
  DrawRectangle(80, 5, 110, 57)
  love.graphics.setColor(255,255,255,255)
  love.graphics.rectangle("fill", 162, 12, 216, 110)

  love.graphics.setColor(0,0,0,255) -- 검은색 RGBA
  love.graphics.print("아직 마을에 볼 일이 남아있습니다!", 170, 25)

  love.graphics.print("확인하셨다면 'enter'키를 눌러주세요.",168, 90)
end
