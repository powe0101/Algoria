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
    CreateCloud(400,200)

    CreateGround(-49,430) 
    CreateGround(541,430)
    CreateCreeper(-49,430)
    CreateCreeper(541,430)


    CreateQMark(255, 100) 
    CreatePicket(255,115)
    
    CreateCloud(242,120)
    CreateBox(250,140)
    CreateBox(260,140)
    CreateBox(270,140) 


   
 		--pl:StartSummerStage() --스테이지가 변경됐을때 초기좌표로 되돌리기 위한 메서드
	end
end