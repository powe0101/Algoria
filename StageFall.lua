function CreateFall()
	if startStage == 3 then
		CreateGround(-177,76) --도개교가 깔리고 그 아래 강물이 생길거니까 플레이어로 부터 얻은 좌표 기준으로 290이상 못가게 막아야 함.
  	    CreateGround(600,76)

  		CreateTree(150,54)
		CreateTree(300,54)
  		--CreateTree(450,54)
 		CreateTree(600,54)
 		CreateTree(750,54)
	end
end