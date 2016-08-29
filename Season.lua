scale = 2
width = 25
height = 50 --사각형을 만들기 위한 변수들. 마리오에서 따옴

function CheckPortal() --0725 마을에서 포탈같이 일정 좌표에서 ↑키를 누르면 장소가 이동되도록 해봄. by.현식
  -- body
  if love.keyboard.isDown('up')  then --마을에서 스테이지로 넘어갈 때, 좌표값 뿐만 아니라 스테이지레벨도 같이 조건을 줘야할 듯. by.현식 0727
    if pl and 170 < pl:GetX() and pl:GetX() < 190 and stageLevel == 0 then --0722 스테이지 변경을 위한 테스트 진행중.. by.현식
      CheckPopup()
    end
  end
end

function CheckSeason()
  if stageLevel == 1 then
    --CreateSpring() --원래코드
    stageLevel = 5
    CreateBossCastle()
  elseif stageLevel == 2 then
    CreateSummer()
  elseif stageLevel == 3 then
    --CreateFall()
    stageLevel = 7
    CreateBossCastle()
  elseif stageLevel == 4 then
    CreateWinter()
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
  love.graphics.print("봄", 200, 45)
  love.graphics.print("여름", 200, 65)
  love.graphics.print("가을", 200, 85)
  love.graphics.print("겨울", 200, 105)


  if levelCheck == 1 then
    DrawSpringMenu() --처음 선택지는 봄.
  elseif levelCheck ==2 then
    DrawSummerMenu()
  elseif levelCheck == 3 then
    DrawFallMenu()
  elseif levelCheck == 4 then
    DrawWinterMenu()
  end

  love.graphics.setColor(255,255,255,255) -- 하얀색 RGBA
end

function DrawSpringMenu() --팝업창에서 봄 선택
  love.graphics.rectangle("fill", 180,53,10,10)
end

function DrawSummerMenu() --팝업창에서 여름 선택
  love.graphics.rectangle("fill", 180,73,10,10)
end

function DrawFallMenu() --팝업창에서 겨울 선택
  love.graphics.rectangle("fill", 180,93,10,10)
end

function DrawWinterMenu() --팝업창에서 겨울 선택
  love.graphics.rectangle("fill", 180,113,10,10)

end

function DrawRectangle(x, y, width, height) --마리오에서 따온거임
  love.graphics.rectangle("fill", x*scale, y*scale, width*scale, scale)
  love.graphics.rectangle("fill", x*scale, y*scale, scale, height*scale)
  love.graphics.rectangle("fill", x*scale, (y+height-1)*scale, width*scale, scale)
  love.graphics.rectangle("fill", (x+width-1)*scale, y*scale, scale, height*scale)
end

function ControlPopup() --계절을 선택하는 팝업창이 떴을 때, 위/아래키로 스테이지를 선택하는 메서드.
  if popupCheck then
    if love.keyboard.isDown("up") then
      if levelCheck == 1 then
        --스테이지가 1보다 작아지면 아무 동작도 안함
      else
        levelCheck = levelCheck - 1
      end
    end

    if love.keyboard.isDown("down") then
      if levelCheck == 4 then
        --스테이지가 4보다 커지면 아무 동작도 안함
      else
        levelCheck = levelCheck + 1
      end
    end

    if love.keyboard.isDown("return") then --enter키임
      stageLevel = levelCheck
      popupCheck = false

      levelCheck = 1
      DeleteVillage()
      CheckSeason()
    end

    if love.keyboard.isDown("escape") then -- esc누르면 아무일도 일어나지 않고 팝업창이 닫히게끔.
      levelCheck = 1
      popupCheck = false
    end
  end
end
