function CreateWinter()
	if stageLevel == 4 then
	    phase = 1

			pl:reset()
			pl:StartWinterStage() --스테이지가 변경됐을때 초기좌표로 되돌리기 위한 메서드
	end

		CreateGround(-177,76)
		CreateGround(600,76)

		CreateTree(100,80)
end
