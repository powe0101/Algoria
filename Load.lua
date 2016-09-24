function LoadGame()
	if title then --특정 데이터를 불러오는 것 외에는 시작할때와 동일.
	    DeleteStage() -- 타이틀용 마을 삭제
	    stageLevel = 0 -- 마을 스테이지 번호 0
	    title = false -- 타이틀 조건 해제

	    LoadSavedData()
	    LoadItem()

	    pl = Player.create() -- 플레이어 객체
	    pl:reset()
	    CreateVillage() -- 실제 마을 스테이지 생성
	    tempForMainXCoord = true --현식추가
	    reTitleCheck = false --현식추가, 다시 타이틀에 들어왔을때 라이프 안보이게 하깅 ㅟ해서.	    
   	end
end

function LoadSavedData()
	if love.filesystem.exists( 'savedData.txt' ) then
		getSaved = love.filesystem.read('savedData.txt')
		--s1 = s:split("\n")
		for lines in love.filesystem.lines('savedData.txt') do
			table.insert(savedDataList,lines)
		end

		tutorialProgressLevel = tonumber(savedDataList[2])
		talkCountWithElder = tonumber(savedDataList[4])
		clearLevel = tonumber(savedDataList[6])
		stageClearLevel = tonumber(savedDataList[8])
		if tostring(savedDataList[10]) == "false" then
			portalBlock = false
		else
			portalBlock = true
		end
		--portalBlock = savedDataList[10]
		playerLife = tonumber(savedDataList[12])
		if tostring(savedDataList[14]) == "false" then
			firstTalkWithBlacksmith = false
		else
			firstTalkWithBlacksmith = true
		end
    end
end

function LoadItem()
	if stageClearLevel == 2 then --봄 클리어 상태
		SpringStageClear()
	elseif stageClearLevel == 3 then --여름 클리어 상태
		SummerStageClear()
	elseif stageClearLevel == 4 then --가울 클리어 상태
		FallStageClear()
	elseif stageClearLevel == 5 then --겨울 클리어 상태
		WinterStageClear()
	end
end