--테스트 중이기 때문에 우선 로드와 세이브를 따로 구분하지 않았음.

askSave = false
savedList = {}

function CheckGameSave()
	--52~64
  	if stageLevel == 0 and 52 < pl:GetX() and pl:GetX() < 64 and tutorialProgressLevel > 3 then
  		if love.keyboard.isDown('up') then
			askSave = true
		end
  	end
end

function ControlGameSave()
	if askSave and stageLevel == 0 and tutorialProgressLevel > 3 then
		if love.keyboard.isDown('return') then
			askSave = false

			--여기서 세이브 시키는 메서드를 동작시키면 됨
			SaveGame()
		end

		if love.keyboard.isDown('escape') then
			askSave = false
		end
	end
end

function DrawAskSaveGame()
	if askSave then
		AskSaveGame()
	end
end

function AskSaveGame()
  love.graphics.setColor(0,0,0,255) -- 검은색 RGBA
  DrawRectangle(80, 5, 110, 57)
  love.graphics.setColor(255,255,255,255)
  love.graphics.rectangle("fill", 162, 12, 216, 110)

  love.graphics.setColor(0,0,0,255) -- 검은색 RGBA
  love.graphics.print("지금까지의 모험을 기록하시겠습니까?", 170, 25)

  love.graphics.print("저장하시려면 'Enter'키를\n취소하시려면 'ESC'키를 눌러주세요.",168, 80)
end

function SaveGame()
	savedTutorialProgressLevel = tutorialProgressLevel
	savedtalkCountWithElder = talkCountWithElder
	savedClearLevel = clearLevel
	savedStageClearLevel = stageClearLevel --위의 clearLevel과 다른 변수. 이건 단순 아이템을 체킹하기 위한 변수.
	savedPortalBlock = savedPortalBlock
	savedPlayerLife = playerLife

	savedList = {savedTutorialProgressLevel, savedtalkCountWithElder, savedClearLevel, savedStageClearLevel,
				savedPortalBlock, savedPlayerLife}
	hello = "hello"
	savedCheck = love.filesystem.write('savedData.lua', hello )

	if savedCheck then
		love.timer.sleep(2)
	end
end

------------------ 이하 로드

function LoadGame()
	if title then --특정 데이터를 불러오는 것 외에는 시작할때와 동일.
	    DeleteStage() -- 타이틀용 마을 삭제
	    stageLevel = 0 -- 마을 스테이지 번호 0
	    title = false -- 타이틀 조건 해제
	    pl = Player.create() -- 플레이어 객체
	    pl:reset()
	    CreateVillage() -- 실제 마을 스테이지 생성
	    tempForMainXCoord = true --현식추가
	    reTitleCheck = false --현식추가, 다시 타이틀에 들어왔을때 라이프 안보이게 하깅 ㅟ해서.

	    --이 부분에서 저장되어 있던 데이터를 가져와야 함.
	    LoadSavedData()
	    --LoadItem()
   	end
end

function LoadSavedData()
	if love.filesystem.exists( 'savedData.lua' ) then
        savedd = love.filesystem.load( 'savedData.lua' )
        love.timer.sleep(2)

		result = savedd() -- execute the chunk
    end
end

function LoadItem()
	for i = 0, stageClaerLevel-1 do
		--stageClearForItem[i]()
	end
end