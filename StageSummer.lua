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

    ---------------------문제 1
    CreateQMark(60, -65)
    CreatePicket(60,-45)

    --------------------- 1행 구름 
    CreateCloud(-68,-130)
    CreateCloud(142,-130)
    CreateCloud(342,-130)
    CreateCloud(542,-130)
    CreateCloud(742,-130)	
    --------------------- 2행 구름 
    CreateCloud(42,-30)
    ---------------------박스 
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
    CreateCloud(242,-30)
    CreateCloud(442,-30)
    CreateCloud(642,-30)
    ---------------------박스 
    CreateBox(640,-16)
    CreateBox(650,-16)
    CreateBox(660,-16)
    CreateBox(670,-16)
    CreateBox(680,-16)
    CreateBox(690,-16)
    CreateBox(640,-26)
    CreateBox(650,-26)
    CreateBox(660,-26)
    CreateBox(670,-26)
    CreateBox(680,-26)
    CreateBox(690,-26)
    ---------------------
    CreateCloud(842,-30)
     --------------------- 3행 구름 
    CreateCloud(-68,70)
    CreateCloud(142,70)
    CreateCloud(342,70)
            ---------------------박스 
    CreateBox(340,84)
    CreateBox(350,84)
    CreateBox(360,84)
    CreateBox(370,84)
    CreateBox(380,84)
    CreateBox(390,84)
    CreateBox(340,74)
    CreateBox(350,74)
    CreateBox(360,74)
    CreateBox(370,74)
    CreateBox(380,74)
    CreateBox(390,74)
    CreateCloud(542,70)
    CreateCloud(742,70)	
    --------------------- 4행 구름 
	CreateCloud(42,170)
    CreateCloud(242,170)
	CreateCloud(442,170)
	CreateCloud(642,170)
	CreateCloud(842,170)
   
    ---------------------문제 2
    CreatePicket(863,153)
	---------------------- 박스 
	CreateBox(842,176)
    CreateBox(852,176)
    CreateBox(862,176)
    CreateBox(872,176)
    CreateBox(882,176)
    CreateBox(892,176)
    CreateBox(842,166)
    CreateBox(852,166)
    CreateBox(862,166)
    CreateBox(872,166)
    CreateBox(882,166)
    CreateBox(892,166)
	------------------------
	--------------------- 5행 구름 
	CreateCloud(-68,270)
	CreateCloud(142,270)
	---------------------박스 
    CreateBox(140,284)
    CreateBox(150,284)
    CreateBox(160,284)
    CreateBox(170,284)
    CreateBox(180,284)
    CreateBox(190,284)
    CreateBox(140,274)
    CreateBox(150,274)
    CreateBox(160,274)
    CreateBox(170,274)
    CreateBox(180,274)
    CreateBox(190,274)
    ---------------------
    CreateCloud(342,270)
    CreateCloud(542,270)
	CreateCloud(742,270)

	CreateCloud(42,370)
    CreateCloud(250,360)
    ------------------- 문제 3
        --문제 3
    CreatePicket(467,340)
    --------------------- 6행 구름 
    CreateCloud(442,355)
    CreateBox(450,366)
    CreateBox(460,366)
    CreateBox(470,366)
    CreateBox(480,366)
    CreateBox(490,366)
    CreateBox(500,366)
    CreateBox(450,356)
    CreateBox(460,356)
    CreateBox(470,356)
    CreateBox(480,356)
    CreateBox(490,356)
    CreateBox(500,356)
    --

    CreateCloud(642,370)
    CreateCloud(842,370)


    
    CreateCastle(710, 870) -- 중간보스 성
	CreateBackGround(-210,910)
    CreateGround(-180,435)
    CreateGround(410,435)
    CreateCloud(100,460)
    CreateCloud(100,500)
    CreateCloud(100,600)
    CreateCloud(100,700)
    CreateCloud(100,800)
    CreateCloud(100,900)
    CreateCloud(100,1000)

   CreateButton(360,17," Up","Up")
   CreateButton(410,17,"Dwon","Dwon")
   CreateButton(355,44,"Right","Right")
   CreateButton(410,44,"Left","Left")
   CreateButton(459,23.5,"삭\n제","Delete")
   CreateButton(397.5,30,"Start","start")
	end
end
