function CreateSummer()
	if stageLevel == 2 then
        love.graphics.setBackgroundColor(bgcolor)
        
    phase = 1

		PlayAudio("audio/363526.Summer.mp3",1,0.3,true) -- 파일 주소 , 피치, 볼륨, 반복
    HEIGHT=400
    updateScale()

    pl:reset()
		notice = Notice.Create()
		notice:SetText("여름 스테이지")
    pl:StartSummerStage()


    CreateCreeper(-79,430)
    CreateCreeper(500,430)


    --------------------- 1행 구름
    CreateCloud(-68,-130)
    CreateCloud(142,-130)
    CreateCloud(342,-130)
    CreateCloud(542,-130)
    CreateCloud(742,-130)
    CreateCloud(942,-130)
    --------------------- 2행 구름

    CreateCloud(42,-30)
    CreateCloud(242,-30)
    CreateCloud(442,-30)
    CreateCloud(642,-30)
    CreateCloud(842,-30)
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
    CreateCloud(-58,70)
	CreateCloud(142,70)
    CreateCloud(342,70)
    CreateCloud(542,70)
    CreateCloud(742,70)
    CreateCloud(942,70)
    --------------------- 4행 구름
	---------------------문제 1
	CreateQMark(82, 120)
    CreatePicket(82,148)
	CreateCloud(42,170)
    CreateCloud(82,170)
    CreateBox(42,176)
    CreateBox(52,176)
    CreateBox(62,176)
    CreateBox(72,176)
    CreateBox(82,176)
    CreateBox(92,176)
    CreateBox(102,176)
    CreateBox(112,176)
    CreateBox(122,176)
    CreateBox(132,176)
    CreateBox(42,166)
    CreateBox(52,166)
    CreateBox(62,166)
    CreateBox(72,166)
    CreateBox(82,166)
    CreateBox(92,166)  
    CreateBox(102,166)
    CreateBox(112,166)
    CreateBox(122,166)
    CreateBox(132,166)


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
    CreateCloud(942,270)
	
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

    CreateCloud(-68,500)
    CreateCloud(142,500)
    CreateCloud(342,500)
    CreateCloud(542,500)
    CreateCloud(742,500)
    CreateCloud(942,500)

    CreateCloud(42,620)
    CreateCloud(242,620)
    CreateCloud(442,620)
    CreateCloud(642,620)
    CreateCloud(842,620)

    CreateCloud(-68,740)
    CreateCloud(142,740)
    CreateCloud(342,740)
    CreateCloud(542,740)
    CreateCloud(742,740)
    CreateCloud(942,740)
	
	CreateCloud(42,860)
    CreateCloud(242,860)
	CreateCloud(442,860)
	CreateCloud(642,860)
	CreateCloud(842,860)

	end
end
