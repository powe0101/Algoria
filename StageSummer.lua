function CreateSummer()
	if stageLevel == 2 then
    phase = 1

		PlayAudio("audio/363526.Summer.mp3",1,0.3,true) -- 파일 주소 , 피치, 볼륨, 반복
    HEIGHT=400
    updateScale()

    pl:reset()
    pl:StartSummerStage()

    CreateCreeper(-79,430)
    CreateCreeper(500,430)

    ---문제 1
    CreateQMark(60, -65)
    CreatePicket(60,-45)
    CreateCloud(42,-30)
    CreateBox(40,-16)
    CreateBox(50,-16)
    CreateBox(60,-16)
    CreateBox(70,-16)
    CreateBox(80,-16)
    CreateBox(90,-16)
    CreateBox(40,-26)
    CreateBox(50,-26)
    CreateBox(60,-26)
    CreateBox(70,-26)
    CreateBox(80,-26)
    CreateBox(90,-26)
    --문제 3
    CreatePicket(768,125)
    CreateCloud(750,140)
    CreateBox(750,146)
    CreateBox(760,146)
    CreateBox(770,146)
    CreateBox(780,146)
    CreateBox(790,146)
    CreateBox(800,146)
    CreateBox(750,136)
    CreateBox(760,136)
    CreateBox(770,136)
    CreateBox(780,136)
    CreateBox(790,136)
    CreateBox(800,136)
    --문제 3
    CreatePicket(268,345)
    CreateCloud(250,360)
    CreateBox(250,366)
    CreateBox(260,366)
    CreateBox(270,366)
    CreateBox(280,366)
    CreateBox(290,366)
    CreateBox(300,366)
    CreateBox(250,356)
    CreateBox(260,356)
    CreateBox(270,356)
    CreateBox(280,356)
    CreateBox(290,356)
    CreateBox(300,356)

    CreateGround(-100,430)
    CreateGround(421,430)
    CreateBackGround(0,750)
    --pl:StartSummerStage() --스테이지가 변경됐을때 초기좌표로 되돌리기 위한 메서드
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
