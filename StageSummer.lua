function CreateSummer()
	if stageLevel == 2 then
		CreateGround(-177,76) --도개교가 깔리고 그 아래 강물이 생길거니까 플레이어로 부터 얻은 좌표 기준으로 290이상 못가게 막아야 함.
  	CreateGround(600,76)

  	CreateRiver(346,150)
  	CreateRiver(425,150)

  	CreateTree(150,54)
		CreateTree(300,54)
 		CreateTree(600,54)
 		CreateTree(750,54)

 		--여기서부터 
 
        --bridge_frames = love.graphics.newQuad(0,0,128,128,128,128)

        aniBridge = newAnimation(imgBridge, 128, 128, 0.3, 0)
        --aniBridge:setMode("once")
  
        --여기까지 애니메이션 테스트, 메인 이외에 만들면 자꾸 에러남 by.현식 0730
        aniBridge:CreateBridge(100,100)


 		pl:SetStartPosition() --스테이지가 변경됐을때 초기좌표로 되돌리기 위한 메서드
	end
end