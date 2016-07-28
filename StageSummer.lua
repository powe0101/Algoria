function CreateSummer()
	if stageLevel == 2 then
		CreateGround(-177,76) --도개교가 깔리고 그 아래 강물이 생길거니까 플레이어로 부터 얻은 좌표 기준으로 290이상 못가게 막아야 함.
  	    CreateGround(600,76)

  	    CreateRiver(346,150)
  	    CreateRiver(425,150)

  		CreateTree(40,54)
  		CreateTree(145,54)
		CreateTree(250,54)
 		CreateTree(600,54)
 		CreateTree(750,54)

 		pl:SetStartPosition() --스테이지가 변경됐을때 초기좌표로 되돌리기 위한 메서드
	end
end