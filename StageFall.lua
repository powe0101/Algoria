function CreateFall()
    if stageLevel == 3 then --0805HS
    phase = 1 --계절이 생성될때 단계 초기화 

    --말타는 상황을 가정.
    MOVE_POWER = 3 -- 다른 스테이지,마을로 이동할때 다시 초기화해줘야됨.
    --WIDTH = 680
    --updateScale() --속도만으로도 맵이 길어지는 효과가 있어서 사이즈자체를 건드릴 필요는 없을듯.

    CreatePortal(400,113)

    CreateCloud(0,1)
    CreateCloud(100,5)
    CreateCloud(500,1)
    CreateCloud(200,5)
    CreateCloud(300,1)
    --CreateCloud(400,50)

    GroundFrameChange() --가을만 땅의 가로 프레임을 2/1배로 줄임. 다른 스테이지로 이동할때 원복시켜야함.

    CreateGround(-1741,76) 
    CreateGround(-1437,76); 
    CreateGround(-1005,76) 
    CreateGround(-573,76); 
    CreateGround(-269,76)
    CreateGround(163,76)  -- 432 --736/368 
    CreateGround(465,76) 

    CreateTree(110,63)
    CreateTree(400,63)
    CreateTree(-500,63)

    CreateCastle(-1600, 15) -- 중간보스 성

    --CreateTree(150,54)
    --CreateTree(300,54)
    --CreateTree(450,54)

    --1번 문제-------
    CreateQMark(420, 115) 
    CreatePicket(420,146) --phase1 
    aniBridge1 = newAnimation(imgBridge,75,75,0.1,0)
    aniBridge2 = newAnimation(imgBridge,75,75,0.1,0) --1문제 풀때마다 다리가 2개씩 올라옴.
    aniBridge1:setMode("once") 
    aniBridge2:setMode("once") 
    aniBridge1:CreateBridge(93,158) --첫 문제를 풀었다고 가정
    aniBridge2:CreateBridge(29,158) 

    CreateRiver(-12,150)
    CreateRiver(-50,150) --다리랑 이 강물이랑 간격이 딱 맞음.
    --CreateRiver(-213,150)


    --2번 문제------------
    --2번 문제의 느낌표 부터는 문제를 풀어가는 과정에서 바뀌므로 main의 update에서 감지하고 있다가 띄워줌.
    CreatePicket(-310,146) --phase2

    aniBridge3 = newAnimation(imgBridge,75,75,0.1,0) 
    aniBridge4 = newAnimation(imgBridge,75,75,0.1,0) 
    aniBridge3:setMode("once")
    aniBridge4:setMode("once")
    aniBridge3:CreateBridge(-643,158) --두번째 문제를 풀었다고 가정
    aniBridge4:CreateBridge(-707,158) --x 간격은 64

    CreateRiver(-748,150)
    CreateRiver(-786,150)


    --3번 문제-------------
    CreatePicket(-800,146) --phase3
    aniBridge5 = newAnimation(imgBridge,75,75,0.1,0) 
    aniBridge6 = newAnimation(imgBridge,75,75,0.1,0) 
    aniBridge5:setMode("once")
    aniBridge6:setMode("once")
    aniBridge5:CreateBridge(-1075,158) --두번째 문제를 풀었다고 가정
    aniBridge6:CreateBridge(-1139,158) --x 간격은 64

    CreateRiver(-1180,150)
    CreateRiver(-1218,150) 

    --세번째 문제를 풀었다고 가정

    pl:StartFallStage() --스테이지가 변경됐을때 초기좌표로 되돌리기 위한 메서드
    --pl.frame =
    end
end