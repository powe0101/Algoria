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

function InitShortestPath()
  CreateShortestPathtHouse(FIRSTHOUSE_X, FIRSTHOUSE_Y, STARTHOUSE)
  CreateShortestPathtHouse(FIRSTHOUSE_X, SECONDHOUSE_Y, CHECKHOUSE)
  CreateShortestPathtHouse(FIRSTHOUSE_X, THIRDHOUSE_Y, CHECKHOUSE)

  CreateShortestPathtHouse(SECONDHOUSE_x, FIRSTHOUSE_Y, CHECKHOUSE)
  CreateShortestPathtHouse(SECONDHOUSE_x, SECONDHOUSE_Y, CHECKHOUSE)

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
  love.graphics.setColor(255, 255, 255, 255)
end

function ExplainShortestPath()
  love.graphics.setColor(255, 0, 0, 255)
  love.graphics.print("※조작법※\n방향 : Up, Dwon, Left, Right\n선택 : Space",62+285, 13)
  love.graphics.print("\n파란 지붕 집에서 빨간 지붕 집까지",62+285,50)
  love.graphics.print("\n가장 빠른 길을 선택 하시오.",62+285,100)
  love.graphics.setColor(255, 255, 255, 255)
end

function StageWinterAlgorithm()
  ExplainShortestPath()
  InitShortestPath()
  DrawShortestPathHouse()
  DrawShortestPath()
end
