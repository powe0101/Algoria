function CreateFall()
    if stageLevel == 3 then --0805HS
        phase = 1 --계절이 생성될때 단계 초기화
        PlayAudio("audio/363536.Fall.mp3",1,0.3,true) -- 파일 주소 , 피치, 볼륨, 반복
        pl:reset()
        --말타는 상황을 가정.
        MOVE_POWER = 3 -- 다른 스테이지,마을로 이동할때 다시 초기화해줘야됨.
        CreateBackGround(-2224,0)
        CreateBackGround(-1638,0)
        CreateBackGround(-1052,0)
        CreateBackGround(-466,0)
        CreateBackGround(120,0)

        CreateCloud(0,1)
        CreateCloud(100,5)
        CreateCloud(500,1)
        CreateCloud(200,5)
        CreateCloud(300,1)
        --CreateCloud(400,50)

        GroundHalfFrameChange() --가을만 땅의 가로 프레임을 2/1배로 줄임. 다른 스테이지로 이동할때 원복시켜야함.

        CreateGround(-1741,76)
        CreateGround(-1437,76);
        CreateGround(-1005,76)
        CreateGround(-573,76);
        CreateGround(-269,76)
        CreateGround(163,76)  -- 432 --736/368
        CreateGround(465,76)

        CreateTree(-50,80)
        CreateTree(500,80)
        CreateTree(-500,80)

        CreateCastle(-1600, 15) -- 중간보스 성

        --CreateTree(150,54)
        --CreateTree(300,54)
        --CreateTree(450,54)

        --1번 문제-------
        CreateQMark(420, 115)
        CreatePicket(420,146) --phase1
        CreateBridge(93,158) --첫 문제를 풀었다고 가정
        CreateBridge(29,158)

        CreateRiver(-12,150)
        CreateRiver(-50,150) --다리랑 이 강물이랑 간격이 딱 맞음.
        --CreateRiver(-213,150)


        --2번 문제------------
        --2번 문제의 느낌표 부터는 문제를 풀어가는 과정에서 바뀌므로 main의 update에서 감지하고 있다가 띄워줌.
        CreatePicket(-310,146) --phase2

        CreateBridge(-643,158) --두번째 문제를 풀었다고 가정
        CreateBridge(-707,158) --x 간격은 64

        CreateRiver(-748,150)
        CreateRiver(-786,150)


        --3번 문제-------------
        CreatePicket(-800,146) --phase3
        CreateBridge(-1075,158) --두번째 문제를 풀었다고 가정
        CreateBridge(-1139,158) --x 간격은 64

        CreateRiver(-1180,150)
        CreateRiver(-1218,150)

        pl:StartFallStage() --스테이지가 변경됐을때 초기좌표로 되돌리기 위한 메서드
    end
end
