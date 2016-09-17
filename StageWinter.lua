function CreateWinter()
	if stageLevel == 4 then
	    phase = 1
		HEIGHT=400
    	updateScale()

		PlayAudio("audio/363535.Winter.mp3",1,0.3,true) -- 파일 주소 , 피치, 볼륨, 반복
		notice = Notice.Create()
	  notice:SetText("겨울 스테이지")
		pl:reset()
		pl:StartWinterStage() --스테이지가 변경됐을때 초기좌표로 되돌리기 위한 메서드
	end
		--CreatePicket(-20,200)  --진짜 피켓 위치
		--CreatePicket(1040,155)
		--CreatePicket(65,45)
		CreatePicket(-20,330) -- 임시 피켓 위치
		CreatePicket(40,335)
		CreatePicket(65,335)
		CreateCastle(310, -360) -- 중간보스 성
		CreateBackGround(-50,0)
		CreateBackGround(550,0)
		CreateBackGround(-50,-400)
		CreateBackGround(550,-400)
		CreateBackGround(-50,-600)
		CreateBackGround(550,-600)

		CreateGround(-100,245)
		CreateGround(421,245)
		CreateGround(900,245)

		CreateTree(0,272)
		CreateTree(250,272)
		CreateTree(500,272)
		CreateTree(750,272)
		CreateTree(1000,272)

		CreateQMark(-20, 170)

    	--첫번째 문제
		CreateBox(-20,230)
		CreateBox(0,230)
		CreateBox(20,230)
		CreateBox(40,250)
		CreateBox(70,75)--3
		CreateBox(100,250)
		CreateBox(130,110)--3
		CreateBox(160,250)
		CreateBox(180,155)--3
		CreateBox(200,250)
		CreateBox(220,115)--3
 		CreateBox(220,250)
 		CreateBox(220,350)
		CreateBox(240,250)
 		CreateBox(240,350)
 		CreateBox(260,155)--3
		CreateBox(260,250)
		CreateBox(260,350)
		CreateBox(280,270)
		CreateBox(300,290)
		CreateBox(310,330)

  	CreateBox(340,155)--3
		CreateBox(360,135)--3
	  CreateBox(380,115)--3
	  CreateBox(400,95)--3
	  --두번째 문제
	  CreateBox(440,70)--3
		CreateBox(440,350)
		CreateBox(460,50)--3
	  CreateBox(460,70)--3
		CreateBox(460,350)
		CreateBox(480,70)--3
		CreateBox(480,330)
		CreateBox(480,350)

		CreateBox(510,100)--3
		CreateBox(540,300)
		CreateBox(560,100)--3
		CreateBox(560,280)
		CreateBox(560,300)
		CreateBox(580,300)
		CreateBox(630,120)--3
		CreateBox(630,250)
		CreateBox(630,330)
		CreateBox(690,120)--3
 		CreateBox(690,210)
 		CreateBox(690,290)
 		CreateBox(740,80)--3
 		CreateBox(790,290)
 		CreateBox(810,80)--3
 		CreateBox(810,290)
 		CreateBox(840,100)--3
 		CreateBox(860,290)
 		CreateBox(880,120)--3
 		CreateBox(880,290)
		CreateBox(950,140)--3
  	CreateBox(950,270)
  	CreateBox(970,140)--3
  	CreateBox(990,140)--3
 		CreateBox(990,230)

 		CreateBox(1040,185)
		CreateBox(1060,185)
end
