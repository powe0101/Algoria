
MAZE_X=42
MAZE_Y=-5
MazeCheck=false
MazeButton ={} 
clickCount=0      --몇번 클릭 됬는지 카운트 
clickCountList={} --클릭된 버튼이 무엇인지 가지고 있는 리스트 
    mapBossOne={   
      {1,1,1,1,1,1,1,1,1,1,1,2,1,1},
      {1,1,0,1,0,1,0,0,0,1,1,0,0,1},
      {1,0,0,0,0,0,0,1,1,1,0,1,0,1},
      {1,0,1,1,1,1,0,1,1,0,0,1,0,1},
      {1,0,0,0,0,1,0,0,0,1,0,0,0,1},
      {1,1,0,1,0,1,0,1,0,1,1,1,0,1},
      {0,0,0,1,0,1,0,1,0,0,0,0,0,1},
      {0,1,1,1,1,1,1,1,1,1,1,1,1,1}
    }
    map= {
      {1,1,1,1,1,1,1,1,1,1,1,1,1,1},
      {1,0,0,0,0,0,0,0,0,0,1,1,1,1},
      {1,1,1,1,1,1,1,0,1,0,0,0,1,1},
      {1,0,0,0,0,0,0,0,1,0,1,1,0,1},
      {1,0,1,1,1,1,1,1,1,0,1,1,0,2},
      {1,0,1,0,0,0,0,0,1,0,1,1,0,1},
      {1,0,0,0,1,1,1,1,1,0,0,0,0,1},
      {1,0,1,1,1,1,1,1,1,1,1,1,1,1},
   }
    mapBossTwo = {
      {1,1,1,1,1,1,1,1,1,1,1,1,1,1},
      {1,0,0,0,1,0,1,0,0,0,0,1,1,1},
      {1,1,1,0,1,0,0,0,1,1,0,0,0,1},
      {1,0,0,0,1,0,1,1,1,0,0,1,0,1},
      {2,0,1,0,1,0,0,1,1,0,1,1,0,1},
      {1,0,1,0,1,1,0,1,1,0,0,1,1,1},
      {1,1,1,0,0,0,0,1,1,1,0,0,1,1},
      {1,1,1,1,1,1,1,1,1,1,1,0,1,1}
   }
    mapSummer = {
      {1,1,1,1,1,1,1,1,1,1,2,1,1,1},
      {1,0,1,0,0,0,1,0,0,0,0,0,0,1},
      {1,0,1,0,1,1,1,1,1,1,1,0,1,1},
      {1,0,0,0,1,0,0,0,1,0,0,0,0,1},
      {1,0,1,0,1,0,1,0,1,0,1,1,0,1},
      {1,0,1,0,1,0,1,0,1,0,1,0,0,1},
      {1,0,1,0,0,0,1,0,0,0,1,1,0,1},
      {1,0,1,1,1,1,1,1,1,1,1,1,1,1}
   }

function CreateButton(x,y,text,id)  --버튼 생성 함수  
  table.insert(MazeButton,{x=x,y=y,text=text,id=id})
end

function ButtonDraw() -- 버튼 그리기 함수 
  love.graphics.setColor(0,0,0)
  for i,v in ipairs(MazeButton) do
    if clickCount~=5 and v.text~="Start" then  -- clickCount가 5가 아니면 up dwon left right 버튼 생성
      love.graphics.print(v.text,v.x,v.y)
    elseif clickCount==5 and v.text=="Start" and MazePlaying==false then --clickCount가 5면 start함수 생성 
     love.graphics.print(v.text,v.x,v.y)
    end

  end
  love.graphics.setColor(255, 255, 255, 255)
end



function ButtonClick(x,y)-- 생성된 버튼이 눌렸을시 
  for i,v in ipairs(MazeButton) do
   
     if --버튼 조건문 
     x/2>v.x-5 and 
     x/2<v.x + 40 and
     y/2>v.y-5  and 
     y/2<v.y + 20 then
    if v.id =="Up" and clickCount~=5 then --up키 
       clickCountList[clickCount]=0
       clickCount=clickCount+1-- 클릭 횟수
    end
    if v.id =="Dwon" and clickCount~=5 then --dwon키
       clickCountList[clickCount]=1
       clickCount=clickCount+1
    end
    if v.id =="Right" and clickCount~=5 then --right 키 
       clickCountList[clickCount]=2
       clickCount=clickCount+1 -- 클릭 횟수 
    end
    if v.id =="Left" and clickCount~=5 then --left키 
       clickCountList[clickCount]=3
       clickCount=clickCount+1-- 클릭 횟수
    end
    if v.id == "Delete" and clickCount~=5 and clickCount~=0 then --start 눌렸을시 
      clickCountList[clickCount-1]=nil 
      clickCount=clickCount-1
    end
    if v.id == "start" and clickCount==5  then --start 눌렸을시 
      mazePlayStart=true
    end

    love.timer.sleep(0.2)
    
    end
  end
end

function clickCountListDelete()
   for i=0, clickCount-1 do
    clickCountList[i]=nil
   end
   clickCount=0
end

function MazeMap()
  if phase ==3 then
    map=mapSummer
  elseif stageLevel==6 then
    map=mapBossOne
  end
end

function CreateMaze() --미로 맵 만드는 함수 

  
 	for y=1,#map do
    for x=1,#map[y] do
      if map[y][x] == 1 then
        	CreateBox(MAZE_X+(x*20),MAZE_Y+(y*20))
      end

    end
  end
	MazeCheck=true

  
end

function MazePrint() --버튼이 눌렸을시 머가 눌렸는지 보여주는 함수 
	love.graphics.setColor(0,0,0,255) -- 원상복구
 	
 	

 	if clickCount~=5 then
		love.graphics.rectangle("fill",  397, 12, 2, 60) 
		love.graphics.rectangle("fill", 340, 38, 112,2) 
 		love.graphics.rectangle("fill",  452, 12, 2, 60)--나두고 
 	end
 	
 	love.graphics.rectangle("fill",  477, 12, 2, 60)--나두고
 	love.graphics.rectangle("fill", 340, 70, 220, 2)--나두고
 	love.graphics.setColor(255,255,255,255) -- 검은색 RGBA
 	love.graphics.rectangle("fill", 62, 180, 495, 20)--나두고 
 	love.graphics.setColor(0,0,0,255) -- 검은색 RGBA
	love.graphics.print("\n\n※조작법※\n 'Up','Dwon','Left','Right' 버튼을 \n 5번 누르면 'Start' 나타난다\n'start'를 누르면 그동안 입력한 버튼값 \n 만큼 이동한다. 자 미로를 탈출해라 " ,350,30)
 	love.graphics.print("현재 입력하신 버튼->" ,72,180)
 	love.graphics.print("<- 버튼을 \n 클릭하세요  " ,485,15)

 	if MazePlaying==true then
 		love.graphics.print("ongoing..." ,397.5,30)
 	end

 for i=0,clickCount do
 	if clickCountList[i]==0 then
 	    love.graphics.print("  UP",190+i*38, 180)
    elseif clickCountList[i]==1 then
        love.graphics.print("Dwon",190+i*38, 180)
    elseif clickCountList[i]==2 then
          love.graphics.print("Right",190+i*38, 180)
    elseif clickCountList[i]==3 then
         love.graphics.print("left",190+i*38, 180)
    end
   
end

love.graphics.setColor(255,255,255,255) -- 원상복구
end

function MazeCheckCollect()--미로에서 미로가 끝나거가 답을 틀리는것을 체크 
	if pl and coordinate_Y >8 or coordinate_Y<1 or coordinate_X >15 or coordinate_X<1 or map[coordinate_Y][coordinate_X]==1 then
		LifeMinus()--체력 깍기고 
		pl:StartMaze()--시작점으로 돌아가고 
		mazePlayStart=false--start버튼 클릭 유무 초기화 
	  buttonCount=0 --start후 몇번 실행 되었는지 알려주는거 초기화 
	  clickCountListDelete()--어떤거 클릭했는지 테이블 딜리트 
	  MazePlaying=false
		return
	elseif pl and map[coordinate_Y][coordinate_X]==2 and stageLevel==2 then
      MazeReset()
      pl:SetX(save_X)--플레이어 좌표값 복원 
      pl:SetY(save_Y)
      phase=phase+1
      qmarkCheck = true
      questCheck=false
      if phase==4 then--문제 다 풀었을 시 
        canPass = true
        pl.y=pl.y+180
        
      end

    
  elseif pl and map[coordinate_Y][coordinate_X]==2 and stageLevel==6 then--보스에서 
		  if coordinate_Y==1 and coordinate_X==12 then
      map=mapBossTwo
      BoxListDelete()
      CreateMaze()
      pl.y=pl.y+140
      MazeReset()
     else 
      MazeReset()
      algoCheck=false
    end
	end
end

function MazeReset()--미로 초기화 함수 
  BoxListDelete()
  mazePlayStart=false--start버튼 클릭 유무 초기화 
  buttonCount=0 --start후 몇번 실행 되었는지 알려주는거 초기화 
  clickCountListDelete()--어떤거 클릭했는지 테이블 딜리트
  MazePlaying=false  
end

function MazeStart()--미로 시작 함수 
  BoxListDelete()
  MazePrint()--미로 설명 만드는 함수
  CreateMaze()--미로 만드는 함수
  BoxListDraw()--박스다시 draw
  pl:draw()--플레이어 draw
  ButtonDraw()--버튼 생성
  if pl and mazePlayStart then --
    pl:UpdateMazeMove()
    MazeCheckCollect()
  end
end