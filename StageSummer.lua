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

  
 		--여기서부터 
 
        --bridge_frames = love.graphics.newQuad(0,0,128,128,128,128)

        aniBridge = newAnimation(imgBridge, 128, 128, 0.3, 0)
        --aniBridge:setMode("once")
  
        --여기까지 애니메이션 테스트, 메인 이외에 만들면 자꾸 에러남 by.현식 0730
        aniBridge:CreateBridge(100,100)


 		--pl:StartSummerStage() --스테이지가 변경됐을때 초기좌표로 되돌리기 위한 메서드
	end
end