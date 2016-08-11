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
    CreateCloud(300,0)
    CreateCloud(350,100)  
    CreateCloud(400,200)

    CreateGround(-49,480) 
    CreateGround(541,480)



 		--pl:StartSummerStage() --스테이지가 변경됐을때 초기좌표로 되돌리기 위한 메서드
	end
end