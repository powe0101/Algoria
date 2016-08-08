function CreateFall()
	if stageLevel == 3 then --0805HS
    phase = 1 --계절이 생성될때 단계 초기화 

    CreateCloud(0,1)
    CreateCloud(100,50)
    CreateCloud(500,1)
    CreateCloud(200,50)
    CreateCloud(300,1)
    CreateCloud(400,50)

  	--CreateGround(-530,76) --쭉 이어져있는 경우.
    CreateGround(-736,76)
    CreateGround(63,76)

  	CreateRiver(-112,150)
  	CreateRiver(-150,150)
    CreateRiver(-213,150)

    CreateTree(-300,54)
    CreateTree(-450,54)

  	--CreateTree(150,54)
	--CreateTree(300,54)
 	--CreateTree(450,54)

    CreateQMark(370, 115) --1번 문제

    CreatePicket(370,146) --phase1
    CreatePicket(220,146) --phase2
    CreatePicket(70,146) --phase3

    aniBridge1 = newAnimation(imgBridge,75,75,0.1,0)
    aniBridge2 = newAnimation(imgBridge,75,75,0.1,0)
    aniBridge3 = newAnimation(imgBridge,75,75,0.1,0)
 
    aniBridge1:setMode("once")  
    aniBridge2:setMode("once") 
    aniBridge3:setMode("once")

    --위와 같이 애니메이션으로 사용할 다리 3개에 대한 생성과 설정값만 적용해놓고
    --아래처럼 조건문을 줘서 총 3차례에 걸쳐서 다리가 나타나게 하려고 함.
    --현재 문제가 없기 때문에 숫자키 '9'를 누르면 BridgePassValue값이 조금씩 증가해서
    --다리가 올라오게끔 구상함. by.현식 0802

    aniBridge1:CreateBridge(-6,158) --첫 문제를 풀었다고 가정
    aniBridge2:CreateBridge(-70,158) --두번째 문제를 풀었다고 가정
    aniBridge3:CreateBridge(-134,158) --세번째 문제를 풀었다고 가정

 	pl:StartFallStage() --스테이지가 변경됐을때 초기좌표로 되돌리기 위한 메서드
    --pl.frame =
	end
end