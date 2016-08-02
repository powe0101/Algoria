scale = 2
width = 25
height = 50 --사각형을 만들기 위한 변수들. 마리오에서 따옴

function CheckPortal() --0725 마을에서 포탈같이 일정 좌표에서 ↑키를 누르면 장소가 이동되도록 해봄. by.현식
  -- body
  if love.keyboard.isDown('up') and stageLevel == 0 then --마을에서 스테이지로 넘어갈 때, 좌표값 뿐만 아니라 스테이지레벨도 같이 조건을 줘야할 듯. by.현식 0727
    if 170 < pl:GetX() and pl:GetX() < 190 then --0722 스테이지 변경을 위한 테스트 진행중.. by.현식
      CheckPopup()
      --stageLevel = 3 -- 추후에는 이 부분을 팝업창에서 선택할 수 있도록..
    end
  end
end

function CheckSeason() --아직 가을까지밖에 적용이 안됨.
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

function CheckPopup() --팝업창을 띄우고 메인 update를 멈추기 위해서 bool 변수를 사용함.
  popupCheck = true
end

function DrawPopup()
  love.graphics.setColor(0,0,0,255) -- 검은색 RGBA
  DrawRectangle(80, 5, 100, 80)
  love.graphics.setColor(255,255,255,255)
  love.graphics.rectangle("fill", 162, 12, 196, 156)

  love.graphics.setColor(0,0,0,255) -- 검은색 RGBA
  love.graphics.print("Spring", 200, 45)
  love.graphics.print("Summer", 200, 65)
  love.graphics.print("Fall", 200, 85)
  love.graphics.print("Winter", 200, 105)

  if levelCheck == 1 then
    DrawSpring() --처음 선택지는 봄.
  elseif levelCheck ==2 then
    DrawSummer()
  elseif levelCheck == 3 then
    DrawFall()
  elseif levelCheck == 4 then
    DrawWinter()
  end

  love.graphics.setColor(255,255,255,255) -- 하얀색 RGBA
end

function DrawSpring() --팝업창에서 봄 선택
  love.graphics.rectangle("fill", 180,45,10,10)
end

function DrawSummer() --팝업창에서 여름 선택
  love.graphics.rectangle("fill", 180,65,10,10)
end

function DrawFall() --팝업창에서 겨울 선택
  love.graphics.rectangle("fill", 180,85,10,10)
end

function DrawWinter() --팝업창에서 겨울 선택
  love.graphics.rectangle("fill", 180,105,10,10)

end

function DrawRectangle(x, y, width, height) --마리오에서 따온거임
  love.graphics.rectangle("fill", x*scale, y*scale, width*scale, scale)
  love.graphics.rectangle("fill", x*scale, y*scale, scale, height*scale)
  love.graphics.rectangle("fill", x*scale, (y+height-1)*scale, width*scale, scale)
  love.graphics.rectangle("fill", (x+width-1)*scale, y*scale, scale, height*scale)
end

function ChooseStage() --MessageBox를 이용한 스테이지 선택 방법. But,지금은 안씀. by. 현식 0801
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