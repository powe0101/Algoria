--기존의 Season.lua에서 사용하던 포탈을 관리자모드로 옮김.

portalAdmin = false --앞으로는 포탈을 이용해 마음대로 이동할 수 없고, 관리자 변수가 true되어 있어야만 가능하게 수정.

scale = 2
width = 25
height = 50 --사각형을 만들기 위한 변수들. 마리오에서 따옴

function CheckSeason()
  if stageLevel == 1 then
    --CreateSpring()
    stageLevel = 5; CreateBossCastle()
  elseif stageLevel == 2 then
    CreateSummer()
    --stageLevel = 6; CreateBossCastle()
  elseif stageLevel == 3 then
    --CreateFall()
    stageLevel = 7;    CreateBossCastle()
  elseif stageLevel == 4 then
    --CreateWinter()
    stageLevel = 8
    CreateBossCastle()
  end
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

function ControlAdminPopup() --계절을 선택하는 팝업창이 떴을 때, 위/아래키로 스테이지를 선택하는 메서드.
  if popupCheck and portalAdmin then
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
      DeleteStage()
      CheckSeason()
    end

    if love.keyboard.isDown("escape") then -- esc누르면 아무일도 일어나지 않고 팝업창이 닫히게끔.
      levelCheck = 1
      popupCheck = false
    end
  end
end
