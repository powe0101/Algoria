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

function DrawShortestPath()

end

function ExplainShortestPath()
  love.graphics.setColor(255, 0, 0, 255)
  love.graphics.print("※조작법※\n 'Up','Dwon','Left','Right'",62+285, 13)
  love.graphics.print("",62+285,50)
  love.graphics.print("",62+285,100)
end

function StageWinterAlgorithm()
  ExplainShortestPath()
  
end
