function CreateFall()
	if stageLevel == 3 then
		CreateGround(-177,76) --도개교가 깔리고 그 아래 강물이 생길거니까 플레이어로 부터 얻은 좌표 기준으로 290이상 못가게 막아야 함.
  	CreateGround(622,76)

  	CreateRiver(346,150)
  	CreateRiver(430,150)
    CreateRiver(447,150)

  	CreateTree(150,54)
		CreateTree(300,54)
 		CreateTree(600,54)
 		CreateTree(750,54)

 		--여기서부터 

    aniBridge1 = newAnimation(imgBridge, 75, 61, 0.3, 0)
    --aniBridge2 = newAnimation(imgBridge, 75, 61, 0.3, 0)
    aniBridge1:setMode("once")
      aniBridge1:CreateBridge(425,155)

    if BridegePassValue == 30 then
      
      aniBridge1:setMode("once")
      aniBridge1:CreateBridge(425,155) --첫 문제를 풀었다고 가정
    elseif BridegePassValue == 60 then
      
      --aniBridge2:setMode("once")
      --aniBridge2:CreateBridge(489,155) --두번째 문제를 풀었다고 가정
    end

    if canPass then --문제를 다 풀었을 때 마지막 다리가 올라옴
      --aniBridge3 = newAnimation(imgBridge, 75, 61, 0.3, 0)
      --aniBridge3:setMode("once")
      --aniBridge3:CreateBridge(553,155)
    end

 		pl:SetStartPosition() --스테이지가 변경됐을때 초기좌표로 되돌리기 위한 메서드
	end
end