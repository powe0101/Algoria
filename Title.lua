-- Made : 2016/08/23 - G
-- Name : Title.lua



-- love.keypressed(key,scancode)
-- main.lua -> update
title = false

next_time = love.timer.getTime()
titleImg = love.graphics.newImage("images/title.png")

function DrawTitleMenu()
  suit = require 'suit'
  if SCALE ~= 1 then
    local x,y = suit.getMousePosition()
    suit.updateMouse(x/SCALE,y/SCALE)
  end

  love.graphics.draw(titleImg,WIDTH/2-110,16)
  suit.layout:reset(0,0)
  if suit.Button("게임시작", WIDTH/2-100,HEIGHT/2+20,200,15).hit then
    CheckStartGameForTitle()
  end

  if suit.Button("불러오기", WIDTH/2-100,HEIGHT/2+20+25,200,15).hit then
    if love.filesystem.exists( 'savedData.txt' ) then
      LoadGame()
    else 
      --이 상태면 기존의 세이브가 없는 상태.
      nonLoad = true
    end
  end
  if suit.Button("종료", WIDTH/2-100,HEIGHT/2+20+50,200,15).hit then
    love.event.quit()
  end
end

function TitleRun() --main의 createStage 메서드에서 호출

  if splash == false then
    PlayAudio("audio/363489.Opening.mp3",2,0.3,true) -- 파일 주소 , 피치, 볼륨, 반복
    love.graphics.setBackgroundColor(bgcolor) --배경 색을 지정함
    CreateTitleVillage(0)
    title = true
  end
end

function StopTitleAudio()
  local volume = love.audio.getVolume()
  if bgMusic then
    while volume > 0 do
      print(volume)
      volume = volume - 0.001 --볼륨을 서서히 줄인다.
      love.audio.setVolume(volume)
    end
  end
end


function CreateTitleVillage(_y)
  InitEverything()

  CreateGround(-49,76 - _y)
  CreateGround(541,76 - _y)
  CreateBackGround(-40,0 - _y)
  CreateBackGround(250,0 - _y)
  CreateBackGround(540,0 - _y)
  CreateBackGround(830,0 - _y)
  CreateTree(-50,80 - _y)
  CreateTree(220,80 - _y)
  CreateTree(580,80 - _y)
  CreateTree(800,80 - _y)

  CreateCloud(-50,1 - _y)
  CreateCloud(100,1 - _y)
  CreateCloud(300,1 - _y)
  CreateCloud(500,1 - _y)
  CreateCloud(700,1 - _y)
  CreateCloud(900,1 - _y)

  CreateHouse(17,108)
  CreateChiefHouse(480,77)
  CreateBlackSmithHouse(850,108)



  CreateBackGround(-40,0)
  CreateBackGround(250,0)
  CreateBackGround(540,0)
  CreateBackGround(830,0)
end
