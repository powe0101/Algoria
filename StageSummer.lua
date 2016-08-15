function CreateSummer()
	if stageLevel == 2 then
    phase = 1

    HEIGHT=400
    updateScale()

    pl:reset()
    pl:StartSummerStage()
		CreateCloud(100,200)
		CreateCloud(200,400)
    CreateCloud(300,0)
    CreateCloud(350,100)
    CreateCloud(400,200)

    CreateGround(-49,430)
    CreateGround(541,430)

    CreateQMark(255, 100)
    CreatePicket(255,115)

    CreateCloud(243,120)
    CreateBox(250,150)
    CreateBox(270,150)



 		--pl:StartSummerStage() --스테이지가 변경됐을때 초기좌표로 되돌리기 위한 메서드
	end
end