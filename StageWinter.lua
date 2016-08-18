function CreateWinter()
	if stageLevel == 4 then
	    phase = 1

			pl:reset()
			pl:StartWinterStage() --스테이지가 변경됐을때 초기좌표로 되돌리기 위한 메서드
	end
		CreateBackGround(-50,0)
		CreateBackGround(550,0)
		CreateGround(-177,76)
		CreateGround(600,76)

		CreateTree(220,80)
end
