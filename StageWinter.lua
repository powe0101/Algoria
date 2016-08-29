function CreateWinter()
	if stageLevel == 4 then
	    phase = 1
		HEIGHT=400
    	updateScale()

		PlayAudio("audio/363535.Winter.mp3",1,0.3,true) -- 파일 주소 , 피치, 볼륨, 반복
		
		pl:reset()
		pl:StartWinterStage() --스테이지가 변경됐을때 초기좌표로 되돌리기 위한 메서드
	end
	CreatePicket(-20,200)

			CreatePicket(1040,155)

    	CreatePicket(20,330)
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
        --첫번째 문제 
		CreateQMark(-20, 170) 
    	
    	
    	

		CreateBox(-20,230)
		CreateBox(0,230)
		CreateBox(20,230)
		CreateBox(40,250)
		CreateBox(100,250)
		CreateBox(160,250)
		CreateBox(200,250)
 		CreateBox(220,250)
 		CreateBox(220,350)
 		CreateBox(240,250)
 		CreateBox(240,350)

		CreateBox(260,250)

		CreateBox(260,350)

		CreateBox(280,270)

		CreateBox(300,290)
		CreateBox(310,330)
	   

	  
		CreateBox(440,350)
		CreateBox(460,350)
		CreateBox(480,330)
		CreateBox(480,350)

		CreateBox(540,300)
		CreateBox(560,280)
		CreateBox(560,300)
		CreateBox(580,300)
		
		CreateBox(630,250)
		CreateBox(630,330)
 		CreateBox(690,210)
 		CreateBox(690,290)
 		CreateBox(790,290)
 		CreateBox(810,290)
 		CreateBox(860,290)
 		CreateBox(880,290)
 

 		CreateBox(950,270)
 		CreateBox(970,250)
 		CreateBox(1000,215)
		CreateBox(1040,185)
		CreateBox(1060,185)


 		CreateBox(180,40)
		CreateBox(200,40)
 		CreateBox(200,155)
		CreateBox(220,40)
  		CreateBox(220,155)
   		CreateBox(240,60)
  		CreateBox(240,155)
		CreateBox(280,60)
	    CreateBox(300,60)
	    CreateBox(320,60)
	    CreateBox(340,60)
	    CreateBox(340,155)
	    CreateBox(360,60)
	    CreateBox(360,135)
	    CreateBox(380,115)
	    CreateBox(400,95)
	    CreateBox(440,70)
	    CreateBox(460,50)
	    CreateBox(460,70)
	    CreateBox(480,70)
	    CreateBox(500,50)
	    CreateBox(540,30)
end
