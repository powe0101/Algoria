function CreateSummer()
	if stageLevel == 2 then
    phase = 1
    pl=nil

    HEIGHT=400
    updateScale()
  
    pl = Player.create()
    
    pl:StartSummerStage()
   
    
	CreateCloud(100,200)
	CreateCloud(200,400)
    CreatePicket(200,400)      
    CreateCloud(300,0)
    CreateCloud(350,100)  



    CreateGround(-89,440) 
    CreateGround(521,440)
    CreateCreeper(-89,440)
    CreateCreeper(521,440)


 

    CreateCloud(402,200)
    CreateBox(410,220)
    CreateBox(420,220)
    CreateBox(430,220) 
    CreateBox(440,220)

    CreateQMark(255, 100) 
    CreatePicket(255,115)
    
    CreateCloud(242,120)
    CreateBox(250,140)
    CreateBox(260,140)
    CreateBox(270,140) 
    CreateBox(280,140)


   
 		--pl:StartSummerStage() --스테이지가 변경됐을때 초기좌표로 되돌리기 위한 메서드
	end
end