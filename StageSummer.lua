function CreateSummer()
	if stageLevel == 2 then
    phase = 1


    HEIGHT=400
    updateScale()

    pl:reset()
    pl:StartSummerStage()

    CreateBackGround(0,0)
		CreateCloud(100,200)
		CreateCloud(200,400)
    CreatePicket(200,400)
    CreateCloud(300,0)
    CreateCloud(350,100)
    CreateCloud(400,200)

    CreateGround(-100,430)
    CreateGround(421,430)
    CreateTree(100,890)

    CreateCreeper(-79,430)
    CreateCreeper(500,430)

    CreateQMark(255, 100)
    CreatePicket(255,115)

    CreateCloud(242,120)
    CreateBox(250,140)
    CreateBox(260,140)
    CreateBox(270,140)

    CreateCloud(100,460)
    CreateCloud(100,500)
    CreateCloud(100,600)
		CreateCloud(100,700)
    CreateCloud(100,800)
    CreateCloud(100,900)
    CreateCloud(100,1000)
    CreateCloud(100,1100)
    CreateCloud(100,1200)
	end
end
