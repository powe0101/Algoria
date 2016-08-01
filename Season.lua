function CheckPortal() --0725 마을에서 포탈같이 일정 좌표에서 ↑키를 누르면 장소가 이동되도록 해봄. by.현식
  -- body
  if love.keyboard.isDown('up') and stageLevel == 0 then --마을에서 스테이지로 넘어갈 때, 좌표값 뿐만 아니라 스테이지레벨도 같이 조건을 줘야할 듯. by.현식 0727
    if 170 < pl:GetX() and pl:GetX() < 190 then --0722 스테이지 변경을 위한 테스트 진행중.. by.현식
      ChooseStage()
      if 0 < stageLevel and stageLevel < 5 then
        deleteVillage()
        CheckSeason()
      end
      --stageLevel = 3 -- 추후에는 이 부분을 팝업창에서 선택할 수 있도록..
    end
  end
end

function CheckSeason()
  if stageLevel == 1 then
      --CreateSpring()
    elseif stageLevel == 2 then
      CreateSummer()
    elseif stageLevel == 3 then
      CreateFall()
    elseif stageLevel == 4 then
      --CreateWinter()
  end
end

function ChooseStage() --MessageBox를 이용한 스테이지 선택 방법. But, 너무 단순해서 다른 방법을 알아봤으면 좋겠음. 현재 찾아보는 중임.. by.현식 0729
  local title = "알고리즘 게임"
  local message = "스테이지를 선택하세요"
  local buttons = {"겨울","가을","여름","봄"}
 
  local pressedbutton = love.window.showMessageBox(title, message, buttons)
  if pressedbutton == 1 then
    stageLevel = 4
  elseif pressedbutton == 2 then
    stageLevel = 3
  elseif pressedbutton == 3 then
    stageLevel = 2
  elseif pressedbutton == 4 then
    stageLevel = 1
  end
end