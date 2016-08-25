function CreateWinter()
	if stageLevel == 4 then
	    phase = 1
		HEIGHT=400
    	updateScale()

		PlayAudio("audio/363535.Winter.mp3",1,0.3,true) -- 파일 주소 , 피치, 볼륨, 반복
		
		pl:reset()
		pl:StartWinterStage() --스테이지가 변경됐을때 초기좌표로 되돌리기 위한 메서드
	end
		CreateBackGround(-50,0)
		CreateBackGround(550,170)
		CreateGround(-100,270)
		CreateGround(421,270)
		CreateGround(900,270)
		CreateTree(0,275)
		CreateTree(250,275)
		CreateTree(500,275)
		CreateTree(750,275)
		CreateTree(1000,275)

		CreateBox(0,350)
		CreateBox(20,330)
end
