suit=nil
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
function CheckSummerAlgorithmAnswer()
	-- put the layout origin at position (100,100)
	-- the layout will grow down and to the right from this point
	suit = require 'suit'
	if SCALE ~= 1 then
		local x,y = suit.getMousePosition()
		suit.updateMouse(x/SCALE,y/SCALE)
		-- print("SCALE:"..SCALE)
		-- UI_X = SCALE * 350
		-- UI_Y = SCALE * 80
		-- print("UI_X:"..UI_X.."UI_Y:"..UI_Y)
	end

	suit.layout:reset(0,0)

	-- put an input widget at the layout origin, with a cell size of 200 by 30 pixels
	suit.Input(input, 350,80,200,30)
	if SCALE ~= 1 then
		suit.Label("입력값 : "..input.text,{align="left"},350,80,200,30)
	end

	-- put a label that displays the text below the first cell
	-- the cell size is the same as the last one (200x30 px)
	-- the label text will be aligned to the left
	-- put a button of size 200x30 px in the cell below
	-- if the button is pressed, quit the game
	if suit.Button("정답 확인", 350,120,200,30).hit then
		print(KeepCoin..input.text)
		if tostring(KeepCoin) == input.text then
			print("Correct!")
		else
			LifeMinus()
		end
	end

end


function ButtonDraw(x,y)-- 생성된 버튼이 눌렸을시 
 
   if SCALE ~= 1 then
		local x,y = suit.getMousePosition()
		suit.updateMouse(x/SCALE,y/SCALE)
		-- print("SCALE:"..SCALE)
		-- UI_X = SCALE * 350
		-- UI_Y = SCALE * 80
		-- print("UI_X:"..UI_X.."UI_Y:"..UI_Y)
	end

	suit.layout:reset(0,0)
	if  MazePlaying==false then --start 눌렸을시 
      if suit.Button("삭제",454,11.5,23,56).hit and clickCount~=0 then
      clickCountList[clickCount-1]=nil 
      clickCount=clickCount-1
	 end
    end
	if clickCount~=5 then
	if stageLevel==2 then
    if suit.Button(" pass ",300,11,53,27).hit then
      MazeReset()
     
      pl:SetX(save_X)--플레이어 좌표값 복원 
      pl:SetY(save_Y)
    
      phase=phase+1
      qmarkCheck = true
      questCheck=false
      if phase==4 then--문제 다 풀었을 시 
        canPass = true
        --pl.y=pl.y+180
        MazeMap()
      end

    	end
	end
		if suit.Button(" Up ",344,11,53,27).hit then
			clickCountList[clickCount]=0
       		clickCount=clickCount+1-- 클릭 횟수
		end
		if suit.Button("Down", 399,11,53,27).hit then
		    clickCountList[clickCount]=1
            clickCount=clickCount+1
		end
		if suit.Button("Right", 344,40,53,27).hit then
			clickCountList[clickCount]=2
       		clickCount=clickCount+1 -- 클릭 횟수
		end
		if suit.Button("Left", 399,40,53,27).hit then
			clickCountList[clickCount]=3
      		clickCount=clickCount+1-- 클릭 횟수
		end
	end 
	if clickCount==5 and MazePlaying==false then
		if suit.Button("Start",344,11,108,56).hit then
			mazePlayStart=true
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
  if phase ==4 then
    map=mapBossOne
  end
  if phase ==3  then
    map=mapSummer
  end
 
end

function CreateMaze() --미로 맵 만드는 함수 
    
    suit = require 'suit'
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
		love.graphics.rectangle("fill",  397, 12, 2, 57) 
		love.graphics.rectangle("fill", 340, 38, 112,2) 
 		 
 	end
 	if MazePlaying==false then
 		love.graphics.rectangle("fill",  452, 12, 2, 57)--나두고
 	end
 	
 	love.graphics.rectangle("fill",  477, 12, 2, 57)--나두고
 	love.graphics.rectangle("fill", 340, 67, 220, 2)--나두고
 	love.graphics.setColor(255,255,255,255) -- 검은색 RGBA
 	love.graphics.rectangle("fill", 62, 180, 495, 20)--나두고 
 	love.graphics.setColor(0,0,0,255) -- 검은색 RGBA
	love.graphics.print("\n\n※조작법※\n 'Up','Dwon','Left','Right' 버튼을 \n 5번 누르면 'Start' 나타난다\n'start'를 누르면 그동안 입력한 버튼값 \n 만큼 이동한다. 자 미로를 탈출해라 " ,350,30)
 	love.graphics.print("현재 입력하신 버튼->" ,72,180)
 	love.graphics.print("<- 버튼을 \n 클릭하세요  " ,485,15)

 	if MazePlaying==true then
 		love.graphics.print("Ongoing..." ,393,30)
 	end

 for i=0,clickCount do
 	if clickCountList[i]==0 then
 	    love.graphics.print(" UP",190+i*38, 180)
    elseif clickCountList[i]==1 then
        love.graphics.print("Down",190+i*38, 180)
    elseif clickCountList[i]==2 then
          love.graphics.print("Right",190+i*38, 180)
    elseif clickCountList[i]==3 then
         love.graphics.print("Left",190+i*38, 180)
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
  end
	if pl and map[coordinate_Y][coordinate_X]==2 and stageLevel==2 then
      MazeReset()
      
      pl:SetX(save_X)--플레이어 좌표값 복원 
      pl:SetY(save_Y)
      
      phase=phase+1
      qmarkCheck = true
      questCheck=false
      if phase==4 then--문제 다 풀었을 시 
        canPass = true
        --pl.y=pl.y+180
        MazeMap()
      end

  end
  if pl and map[coordinate_Y][coordinate_X]==2 and stageLevel==6 then--보스에서 
      if coordinate_Y==1 and coordinate_X==12 then
      map=mapBossTwo
      BoxListDelete()
      CreateMaze()
      pl.y=pl.y+140
      MazeReset()
      pl:StartMaze()
     else 
      MazeReset()
      SummerClear()
    end
  end
  ControlFadeOutVerMouse()
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

function SummerClear()
  if stageLevel == 6 then
    algoCheck = false
    bossTalkCheck = false
    bossClearCheck = true
    BossListDelete()
  end
end