--테스트 중이기 때문에 우선 로드와 세이브를 따로 구분하지 않았음.

getSaved = nil
askSave = false
savedDataList = {}

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
	savedString = "tutorialProgressLevel:\n"..tostring(tutorialProgressLevel).."\n"..
	"talkCountWithElder:\n"..tostring(talkCountWithElder).."\n"..
	"clearLevel:\n"..tostring(clearLevel).."\n"..
	"stageClearLevel:\n"..tostring(stageClearLevel).."\n".. 
	--위의 clearLevel과 다른 변수. 이건 단순 아이템을 체킹하기 위한 변수.
	"portalBlock:\n"..tostring(portalBlock).."\n"..
	"playerLife:\n"..tostring(playerLife).."\n"..
	"firstTalkWithBlacksmith\n"..tostring(firstTalkWithBlacksmith)

	--love.filesystem.setIdentity("Algoria") --세이브 디렉토리 경로
	savedCheck = love.filesystem.write('savedData.txt', savedString )
end