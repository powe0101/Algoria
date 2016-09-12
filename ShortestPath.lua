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
  love.graphics.rectangle("fill", FIRSTHOUSE_X+HOUSE_SIZE, FIRSTHOUSE_Y+HOUSE_HALFSIZE+5, PATH_X, PATH_SIZE)
  love.graphics.rectangle("fill", SECONDHOUSE_x+HOUSE_SIZE, FIRSTHOUSE_Y+HOUSE_HALFSIZE+5, PATH_X, PATH_SIZE)
  love.graphics.rectangle("fill", FIRSTHOUSE_X+HOUSE_SIZE, SECONDHOUSE_Y+HOUSE_HALFSIZE+5, PATH_X, PATH_SIZE)
  love.graphics.rectangle("fill", FIRSTHOUSE_X+HOUSE_SIZE, THIRDHOUSE_Y+HOUSE_HALFSIZE+5, PATH_X*2+HOUSE_SIZE, PATH_SIZE)

  love.graphics.rectangle("fill", FIRSTHOUSE_X+HOUSE_HALFSIZE-2, FIRSTHOUSE_Y+HOUSE_SIZE, PATH_SIZE, PATH_Y)
  love.graphics.rectangle("fill", SECONDHOUSE_x+HOUSE_HALFSIZE-2, FIRSTHOUSE_Y+HOUSE_SIZE, PATH_SIZE, PATH_Y)
  love.graphics.rectangle("fill", THIRDHOUSE_X+HOUSE_HALFSIZE-2, FIRSTHOUSE_Y+HOUSE_SIZE, PATH_SIZE, PATH_Y*2+HOUSE_SIZE)
  love.graphics.rectangle("fill", FIRSTHOUSE_X+HOUSE_HALFSIZE-2, SECONDHOUSE_Y+HOUSE_SIZE, PATH_SIZE, PATH_Y)

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
  love.graphics.print("\n\n파란 지붕 집에서 빨간 지붕 집까지",62+285,50)
  love.graphics.print("\n가장 빠른 길을 선택 하시오.",62+285,100)
  love.graphics.setColor(255, 255, 255, 255)
end

StartPos = 1
EndPos = 7
CurPos = StartPos
checkTwoPoint = {}
for i=1, 7 do
  checkTwoPoint[i] = {}
  for j=1, 7 do
    checkTwoPoint[i][j] = false
  end
end
currentVisit = {1, 0, 0, 0, 0, 0, 0}
checkVisit = {0, 0, 0, 0, 0, 0, 0}

function ControlShortestPath()
  if stageLevel == 8 and algoCheck then
  -- 최단거리 알고리즘 컨트롤 시작
    if love.keyboard.isDown("up") then
    end
    if love.keyboard.isDown("down") then
    end
    if love.keyboard.isDown("left") then
    end
    if love.keyboard.isDown("right") then
    end
    if love.keyboard.isDown("space") then
      love.graphics.print("\n컨트롤 최단거리 함수 진입",62+285,100)
    end
  -- 끝
  end
end

function updatePath()
  if currentVisit[CurPos] == 1 then
    currentVisit[CurPos] = 0
    CurPos = 2
    currentVisit[CurPos] = 1
  end
  if  currentVisit[CurPos] == 2 then
    love.graphics.setColor(255, 0, 0, 255)
    love.graphics.rectangle("fill", FIRSTHOUSE_X+HOUSE_SIZE, FIRSTHOUSE_Y+HOUSE_HALFSIZE+5, PATH_X, PATH_SIZE)
    love.graphics.setColor(255, 255, 255, 255)
  end
end

function StageWinterAlgorithm()
  ExplainShortestPath()
  InitShortestPathHouse()
  DrawShortestPathHouse()
  DrawShortestPath()
end
