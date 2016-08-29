-- Made : 2016/08/23 - G
-- Name : Title.lua



-- love.keypressed(key,scancode)
-- main.lua -> update
title = false

min_dt = 1/30
next_time = love.timer.getTime()

function DrawTitleMenu()
  love.graphics.setColor(0,0,0)
  love.graphics.print("Press Enter Key",250,100)
  love.graphics.setColor(255,255,255,255)
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

  CreateHouse(17,108 - _y)
  CreateChiefHouse(480,77 - _y)
  CreateBlackSmithHouse(850,108 - _y)

  CreatePortal(300,113 - _y) -- 0725 마을 집 문 앞에 만들어놓은 포탈은 세이브/로드 팝업을 띄우도록 추후에 수정해야함. by.현식

  --CreateQMark(Chief.x, 115) --장로위에 느낌표.
end
