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

dist = {0, 999, 999, 999, 999, 999, 999, 999}
visit = {0, 0, 0, 0, 0, 0 ,0}
-- 다차원 배열 초기화
distTwoPoint = {}
for i=1, #dist do
  distTwoPoint[i] = {}
  for j=1, #dist do
    distTwoPoint[i][j] = 0
  end
end

function CreateShortestPath()

end

function ShortestPath()
  for i=1, #dist do
    min = 999
    -- 가장 가까운 지점 찾기
    for j=1, #dist do
      if visit[j] == 0 and min > dist[j] then
        min = dist[j]
        v = j
      end
    end
  end
    -- 가장 가까운 지점 방문
    visit[v] = 1

    for j=1, #dist do
        if dist[j] > dist[v] + distTwoPoint[v][j] then
          dist[j] = dist[v] + distTwoPoint[v][j]
        end
  end
end
