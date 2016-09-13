--[[
1 ~ 7의 경유지 (시작:1 끝:7)
가중치(중간 경료 길이) 개수 9
a[1][2] = 4 (1에서 2까지의 거리, 가중치는 4)
a[1][3] = 2
a[2][4] = 1
a[2][5] = 2
a[3][4] = 7
a[3][6] = 3
a[4][7] = 3
a[5][7] = 1
a[6][7] = 5
]]

INFINITE = 999
STARTHOUSE = 1
CHECKHOUSE = 2
ENDHOUSE = 3
VISITHOUSE = 4
CHOOSEHOUSE = 5

FIRSTHOUSE_X = 70+20
SECONDHOUSE_x = 160+20
THIRDHOUSE_X = 250+20

FIRSTHOUSE_Y = 25
SECONDHOUSE_Y = 75
THIRDHOUSE_Y = 125

HOUSE_SIZE = 32
HOUSE_HALFSIZE = 16

PATH_X = 58
PATH_Y = 18
PATH_SIZE = 5

-- 최단 경로 저장 배열
dist = {0, INFINITE, INFINITE, INFINITE, INFINITE, INFINITE, INFINITE, INFINITE}
-- 방문 여부 표현
visit = {0, 0, 0, 0, 0, 0 ,0}
-- 다차원 배열 초기화
distTwoPoint = {}
for i=1, 7 do
  distTwoPoint[i] = {}
  for j=1, 7 do
    distTwoPoint[i][j] = INFINITE
  end
end
-- 원하는 지점과 지점사이의 거리
distTwoPoint[1][2]=4
distTwoPoint[1][3]=2
distTwoPoint[2][4]=1
distTwoPoint[2][5]=2
distTwoPoint[3][4]=7
distTwoPoint[3][6]=3
distTwoPoint[4][7]=3
distTwoPoint[5][7]=1
distTwoPoint[6][7]=5

function ShortestPath()
  for i=1, 7 do
    MINDIST = INFINITE
    -- 가장 가까운 지점 찾기
    for j=1, 7 do
      if visit[j] == 0 and min > dist[j] then
        MINDIST = dist[j]
        v = j
      end
    end
  end
  -- 가장 가까운 지점 방문
  visit[v] = 1

  for j=1, 7 do
      if dist[j] > dist[v] + distTwoPoint[v][j] then
        dist[j] = dist[v] + distTwoPoint[v][j]
      end
  end
end

--[[
1 2 5
3 4
6   7
]]
function InitShortestPathHouse()
  -- 1 3 6
  CreateShortestPathtHouse(FIRSTHOUSE_X, FIRSTHOUSE_Y, STARTHOUSE)
  CreateShortestPathtHouse(FIRSTHOUSE_X, SECONDHOUSE_Y, CHECKHOUSE)
  CreateShortestPathtHouse(FIRSTHOUSE_X, THIRDHOUSE_Y, CHECKHOUSE)
  -- 2 4
  CreateShortestPathtHouse(SECONDHOUSE_x, FIRSTHOUSE_Y, CHECKHOUSE)
  CreateShortestPathtHouse(SECONDHOUSE_x, SECONDHOUSE_Y, CHECKHOUSE)
  -- 5 7
  CreateShortestPathtHouse(THIRDHOUSE_X, FIRSTHOUSE_Y, CHECKHOUSE)
  CreateShortestPathtHouse(THIRDHOUSE_X, THIRDHOUSE_Y, ENDHOUSE)
end

function DrawShortestPathHouse()
  ShortestPathHouseListDraw()
end

function DrawShortestPath()
  love.graphics.setColor(0, 0, 0, 255)
  --[[
  1 - 2 - 5
  3 - 4
  6 ------7
  ]]
  love.graphics.rectangle("fill", FIRSTHOUSE_X+HOUSE_SIZE, FIRSTHOUSE_Y+HOUSE_HALFSIZE+5, PATH_X, PATH_SIZE)
  love.graphics.rectangle("fill", SECONDHOUSE_x+HOUSE_SIZE, FIRSTHOUSE_Y+HOUSE_HALFSIZE+5, PATH_X, PATH_SIZE)
  love.graphics.rectangle("fill", FIRSTHOUSE_X+HOUSE_SIZE, SECONDHOUSE_Y+HOUSE_HALFSIZE+5, PATH_X, PATH_SIZE)
  love.graphics.rectangle("fill", FIRSTHOUSE_X+HOUSE_SIZE, THIRDHOUSE_Y+HOUSE_HALFSIZE+5, PATH_X*2+HOUSE_SIZE, PATH_SIZE)
  --[[
  1  2  5
  \  \  \
  3  4  \
  \     \
  6     7
  ]]
  love.graphics.rectangle("fill", FIRSTHOUSE_X+HOUSE_HALFSIZE-2, FIRSTHOUSE_Y+HOUSE_SIZE, PATH_SIZE, PATH_Y)
  love.graphics.rectangle("fill", SECONDHOUSE_x+HOUSE_HALFSIZE-2, FIRSTHOUSE_Y+HOUSE_SIZE, PATH_SIZE, PATH_Y)
  love.graphics.rectangle("fill", THIRDHOUSE_X+HOUSE_HALFSIZE-2, FIRSTHOUSE_Y+HOUSE_SIZE, PATH_SIZE, PATH_Y*2+HOUSE_SIZE)
  love.graphics.rectangle("fill", FIRSTHOUSE_X+HOUSE_HALFSIZE-2, SECONDHOUSE_Y+HOUSE_SIZE, PATH_SIZE, PATH_Y)
  -- 4에서 7로 대각선
  love.graphics.polygon("fill", SECONDHOUSE_x-3+HOUSE_SIZE+5, SECONDHOUSE_Y-3+HOUSE_SIZE,
                                SECONDHOUSE_x-3+HOUSE_SIZE, SECONDHOUSE_Y-3+HOUSE_SIZE+5,
                                THIRDHOUSE_X+5-5, THIRDHOUSE_Y+10,
                                THIRDHOUSE_X+5, THIRDHOUSE_Y+10-5)

  love.graphics.print(distTwoPoint[1][2], FIRSTHOUSE_X+HOUSE_SIZE+PATH_X/2, FIRSTHOUSE_Y+HOUSE_HALFSIZE-10)
  love.graphics.print(distTwoPoint[2][5], SECONDHOUSE_x+HOUSE_SIZE+PATH_X/2, FIRSTHOUSE_Y+HOUSE_HALFSIZE-10)
  love.graphics.print(distTwoPoint[3][4], FIRSTHOUSE_X+HOUSE_SIZE+PATH_X/2, SECONDHOUSE_Y+HOUSE_HALFSIZE-10)
  love.graphics.print(distTwoPoint[6][7], FIRSTHOUSE_X+HOUSE_SIZE+PATH_X, THIRDHOUSE_Y+HOUSE_HALFSIZE-10)

  love.graphics.print(distTwoPoint[1][3], FIRSTHOUSE_X+HOUSE_HALFSIZE-2-10, FIRSTHOUSE_Y+HOUSE_SIZE+PATH_Y/4)
  love.graphics.print(distTwoPoint[2][4], SECONDHOUSE_x+HOUSE_HALFSIZE-2-10, FIRSTHOUSE_Y+HOUSE_SIZE+PATH_Y/4)
  love.graphics.print(distTwoPoint[5][7], THIRDHOUSE_X+HOUSE_HALFSIZE-2-10, FIRSTHOUSE_Y+HOUSE_SIZE+PATH_Y)
  love.graphics.print(distTwoPoint[3][6], FIRSTHOUSE_X+HOUSE_HALFSIZE-2-10, SECONDHOUSE_Y+HOUSE_SIZE+PATH_Y/4)

  love.graphics.print(distTwoPoint[4][7], SECONDHOUSE_x-3+HOUSE_SIZE+5+PATH_X/2, SECONDHOUSE_Y-3+HOUSE_SIZE-10)

  love.graphics.setColor(255, 255, 255, 255)
end

function ExplainShortestPath()
  love.graphics.setColor(255, 0, 0, 255)
  love.graphics.print("※조작법※\n방향 : Up, Dwon, Left, Right\n선택 : Space",62+285, 13)
  --love.graphics.print("\n\n파란 지붕 집에서 빨간 지붕 집까지",62+285,50)
  --love.graphics.print("\n가장 빠른 길을 선택 하시오.",62+285,100)
  love.graphics.print("\n\nfirstPos: "..firstPos.."  secondPos: "..secondPos,62+285,50)
  love.graphics.print("\ncheckPoint[firstPos][secondPos]: "..checkPoint[firstPos][secondPos],62+285,100)
  love.graphics.print("CurPos: "..CurPos.."  PrePos: "..PrePos.."\n",62+285,150)
  love.graphics.setColor(255, 255, 255, 255)
end

CurPos = 1
PrePos = 1
firstPos = CurPos
secondPos = PrePos
checkVisit = {0, 0, 0, 0, 0, 0, 0}
CurPath = 1
Path1To2 = 1
Path1To3 = 2
Path2To4 = 3
Path2To5 = 4
Path3To4 = 5
Path3To6 = 6
Path4To7 = 7
Path5To7 = 8
Path6To7 = 9
checkPoint = {}
for i=1, 7 do
  checkPoint[i] = {}
  for j=1, 7 do
    checkPoint[i][j] = 0
  end
end

function ControlShortestPath()
  if stageLevel == 8 and algoCheck then
  -- 최단거리 알고리즘 컨트롤 시작
    if love.keyboard.isDown("up") then
      PathMoveUp()
    elseif love.keyboard.isDown("down") then
      PathMoveDown()
    elseif love.keyboard.isDown("left") then
      PathMoveLeft()
    elseif love.keyboard.isDown("right") then
      PathMoveRight()
    end
    if love.keyboard.isDown("space") then
      firstPos = CurPos
      secondPos = PrePos

      if checkVisit[CurPos] == 1 then
        checkVisit[CurPos] = 0
        checkPoint[firstPos][secondPos] = 0
        checkPoint[secondPos][firstPos] = 0
      else
        checkVisit[CurPos] = 1
        checkPoint[firstPos][secondPos] = 1
        checkPoint[secondPos][firstPos] = 1
      end
    end
  -- 끝
  end
end

function PathMoveUp()
  if CurPos == 1 then
  elseif CurPos == 2 then
  elseif CurPos == 3 then
    CurPos = 1
    PrePos = 3
  elseif CurPos == 4 then
    CurPos = 2
    PrePos = 4
  elseif CurPos == 5 then
  elseif CurPos == 6 then
    CurPos = 3
    PrePos = 6
  elseif CurPos == 7 then
    if PrePos == 4 then
      CurPos = 4
      PrePos = 7
    elseif PrePos == 5 then
      CurPos = 5
      PrePos = 7
    elseif PrePos == 6 then
      CurPos = 5
      PrePos = 7
    end
  end
end

function PathMoveDown()
  if CurPos == 1 then
    CurPos = 3
    PrePos = 1
  elseif CurPos == 2 then
    CurPos = 4
    PrePos = 2
  elseif CurPos == 3 then
    CurPos = 6
    PrePos = 3
  elseif CurPos == 4 then
    CurPos = 7
    PrePos = 4
  elseif CurPos == 5 then
    CurPos = 7
    PrePos = 5
  elseif CurPos == 6 then
  elseif CurPos == 7 then
  end
end

function PathMoveLeft()
  if CurPos == 1 then
  elseif CurPos == 2 then
    CurPos = 1
    PrePos = 2
  elseif CurPos == 3 then
  elseif CurPos == 4 then
    CurPos = 3
    PrePos = 4
  elseif CurPos == 5 then
    CurPos = 2
    PrePos = 5
  elseif CurPos == 6 then
  elseif CurPos == 7 then
    if PrePos == 4 then
      CurPos = 4
      PrePos = 7
    elseif PrePos == 5 then
      CurPos = 6
      PrePos = 7
    elseif PrePos == 6 then
      CurPos = 6
      PrePos = 7
    end
  end
end

function PathMoveRight()
  if CurPos == 1 then
    CurPos = 2
    PrePos = 1
  elseif CurPos == 2 then
    CurPos = 5
    PrePos = 2
  elseif CurPos == 3 then
    CurPos = 4
    PrePos = 3
  elseif CurPos == 4 then
    CurPos = 7
    PrePos = 4
  elseif CurPos == 5 then
  elseif CurPos == 6 then
    CurPos = 7
    PrePos = 6
  elseif CurPos == 7 then
  end
end
function UpdatePath()
  UpdateCurrentPosition()
  UpdateCheckPath()
end

function UpdateCheckPath()
  love.graphics.setColor(255, 0, 0, 255)
  if checkVisit[2] == 1 then
    love.graphics.rectangle("fill", FIRSTHOUSE_X+HOUSE_SIZE, FIRSTHOUSE_Y+HOUSE_HALFSIZE+5, PATH_X, PATH_SIZE)
  end
  if checkVisit[3] == 1 then
    love.graphics.rectangle("fill", FIRSTHOUSE_X+HOUSE_HALFSIZE-2, FIRSTHOUSE_Y+HOUSE_SIZE, PATH_SIZE, PATH_Y)
  end
  if checkVisit[4] == 1 then
    if checkPoint[2][4] == 1 then
      love.graphics.rectangle("fill", SECONDHOUSE_x+HOUSE_HALFSIZE-2, FIRSTHOUSE_Y+HOUSE_SIZE, PATH_SIZE, PATH_Y)
    end
    if checkPoint[3][4] == 1 then
      love.graphics.rectangle("fill", FIRSTHOUSE_X+HOUSE_SIZE, SECONDHOUSE_Y+HOUSE_HALFSIZE+5, PATH_X, PATH_SIZE)
    end
  end
  if checkVisit[5] == 1 then
    love.graphics.rectangle("fill", FIRSTHOUSE_X+HOUSE_SIZE, FIRSTHOUSE_Y+HOUSE_HALFSIZE+5, PATH_X, PATH_SIZE)
  end
  if checkVisit[6] == 1 then
    love.graphics.rectangle("fill", FIRSTHOUSE_X+HOUSE_SIZE, FIRSTHOUSE_Y+HOUSE_HALFSIZE+5, PATH_X, PATH_SIZE)
  end
  if checkVisit[7] == 1 then
    love.graphics.rectangle("fill", FIRSTHOUSE_X+HOUSE_SIZE, FIRSTHOUSE_Y+HOUSE_HALFSIZE+5, PATH_X, PATH_SIZE)
  end
  love.graphics.setColor(255, 255, 255, 255)

end

function UpdateCurrentPosition()
  if CurPos == 1 then
    love.graphics.setColor(0, 255, 0, 255)
    love.graphics.rectangle("fill", FIRSTHOUSE_X+HOUSE_SIZE, FIRSTHOUSE_Y+HOUSE_HALFSIZE+5, PATH_X, PATH_SIZE)
    love.graphics.rectangle("fill", FIRSTHOUSE_X+HOUSE_HALFSIZE-2, FIRSTHOUSE_Y+HOUSE_SIZE, PATH_SIZE, PATH_Y)
    love.graphics.setColor(255, 255, 255, 255)
  elseif CurPos == 2 then
    love.graphics.setColor(0, 255, 0, 255)
    love.graphics.rectangle("fill", FIRSTHOUSE_X+HOUSE_SIZE, FIRSTHOUSE_Y+HOUSE_HALFSIZE+5, PATH_X, PATH_SIZE)
    love.graphics.rectangle("fill", SECONDHOUSE_x+HOUSE_HALFSIZE-2, FIRSTHOUSE_Y+HOUSE_SIZE, PATH_SIZE, PATH_Y)
    love.graphics.rectangle("fill", SECONDHOUSE_x+HOUSE_SIZE, FIRSTHOUSE_Y+HOUSE_HALFSIZE+5, PATH_X, PATH_SIZE)
    love.graphics.setColor(255, 255, 255, 255)
  elseif CurPos == 3 then
    love.graphics.setColor(0, 255, 0, 255)
    love.graphics.rectangle("fill", FIRSTHOUSE_X+HOUSE_HALFSIZE-2, FIRSTHOUSE_Y+HOUSE_SIZE, PATH_SIZE, PATH_Y)
    love.graphics.rectangle("fill", FIRSTHOUSE_X+HOUSE_SIZE, SECONDHOUSE_Y+HOUSE_HALFSIZE+5, PATH_X, PATH_SIZE)
    love.graphics.rectangle("fill", FIRSTHOUSE_X+HOUSE_HALFSIZE-2, SECONDHOUSE_Y+HOUSE_SIZE, PATH_SIZE, PATH_Y)
    love.graphics.setColor(255, 255, 255, 255)
  elseif CurPos == 4 then
    love.graphics.setColor(0, 255, 0, 255)
    love.graphics.rectangle("fill", SECONDHOUSE_x+HOUSE_HALFSIZE-2, FIRSTHOUSE_Y+HOUSE_SIZE, PATH_SIZE, PATH_Y)
    love.graphics.rectangle("fill", FIRSTHOUSE_X+HOUSE_SIZE, SECONDHOUSE_Y+HOUSE_HALFSIZE+5, PATH_X, PATH_SIZE)
    love.graphics.polygon("fill", SECONDHOUSE_x-3+HOUSE_SIZE+5, SECONDHOUSE_Y-3+HOUSE_SIZE,
                                SECONDHOUSE_x-3+HOUSE_SIZE, SECONDHOUSE_Y-3+HOUSE_SIZE+5,
                                THIRDHOUSE_X+5-5, THIRDHOUSE_Y+10,
                                THIRDHOUSE_X+5, THIRDHOUSE_Y+10-5)
    love.graphics.setColor(255, 255, 255, 255)
  elseif CurPos == 5 then
    love.graphics.setColor(0, 255, 0, 255)
    love.graphics.rectangle("fill", SECONDHOUSE_x+HOUSE_SIZE, FIRSTHOUSE_Y+HOUSE_HALFSIZE+5, PATH_X, PATH_SIZE)
    love.graphics.rectangle("fill", THIRDHOUSE_X+HOUSE_HALFSIZE-2, FIRSTHOUSE_Y+HOUSE_SIZE, PATH_SIZE, PATH_Y*2+HOUSE_SIZE)
    love.graphics.setColor(255, 255, 255, 255)
  elseif CurPos == 6 then
    love.graphics.setColor(0, 255, 0, 255)
    love.graphics.rectangle("fill", FIRSTHOUSE_X+HOUSE_HALFSIZE-2, SECONDHOUSE_Y+HOUSE_SIZE, PATH_SIZE, PATH_Y)
    love.graphics.rectangle("fill", FIRSTHOUSE_X+HOUSE_SIZE, THIRDHOUSE_Y+HOUSE_HALFSIZE+5, PATH_X*2+HOUSE_SIZE, PATH_SIZE)
    love.graphics.setColor(255, 255, 255, 255)
  elseif CurPos == 7 then
    love.graphics.setColor(0, 255, 0, 255)
    love.graphics.rectangle("fill", FIRSTHOUSE_X+HOUSE_SIZE, THIRDHOUSE_Y+HOUSE_HALFSIZE+5, PATH_X*2+HOUSE_SIZE, PATH_SIZE)
    love.graphics.rectangle("fill", THIRDHOUSE_X+HOUSE_HALFSIZE-2, FIRSTHOUSE_Y+HOUSE_SIZE, PATH_SIZE, PATH_Y*2+HOUSE_SIZE)
    love.graphics.polygon("fill", SECONDHOUSE_x-3+HOUSE_SIZE+5, SECONDHOUSE_Y-3+HOUSE_SIZE,
                                  SECONDHOUSE_x-3+HOUSE_SIZE, SECONDHOUSE_Y-3+HOUSE_SIZE+5,
                                  THIRDHOUSE_X+5-5, THIRDHOUSE_Y+10,
                                  THIRDHOUSE_X+5, THIRDHOUSE_Y+10-5)
    love.graphics.setColor(255, 255, 255, 255)
  end
end

function StageWinterAlgorithm()
  ExplainShortestPath()
  InitShortestPathHouse()
  DrawShortestPathHouse()
  DrawShortestPath()
  UpdatePath()
end
