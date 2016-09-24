returnToVillage = false
checkClearOrDeath = false
--298 328

function ControlBackToVillage() --여름은 336~364, 봄은 283~316
	if stageLevel > 4 and bossClearCheck then
		if stageLevel == 6 and 210 < pl:GetX() and pl:GetX() < 242 then
			if love.keyboard.isDown('up') then
				returnToVillage = true
			end
		elseif 283 < pl:GetX() and pl:GetX() < 316 then
			if love.keyboard.isDown('up') then
				returnToVillage = true
			end
		end
	end

	if stageLevel > 4 and bossClearCheck and returnToVillage then
		if love.keyboard.isDown('return') then
			BackToVillageAfterClear()
		end

		if love.keyboard.isDown('escape') then
			returnToVillage = false
		end
	end
end

function BackToVillageAfterClear()
	--슬립 적절한 위치에서 주는거랑 클리어할때 clearLevel 다시 배정하느거 수정할 것.
	--love.timer.sleep(2)

	DeleteStage()
	clearLevel = stageLevel - 3
	--stageLevel = 0 --마을로 가니까.

	--스테이지를 초기화하면서 모든 것들을 다 false로 만들어줌. 그래야 멈추지 않음.
	InitWhenClear()

	bossClearCheck = false
	returnToVillage = false
	checkClearOrDeath = true --by.현식 0918 , 마을에 돌아갔을때 죽어서 돌아가는지 클리어해서 돌아가는지 여부를 확인함.

	if stageClearLevel > 0 then
		stageClearForItem[stageClearLevel]()
		stageClearLevel = stageClearLevel + 1
	end

	CreateVillage()
end

function ClearFallBoss()
	bossClearCheck = true
	printBossClear = true
end

function SkipFallBoss()
	printBossClear = false
   	algoCheck = false
   	bossTalkCheck = false
   	BossListDelete()
end

function IfStageClear()
	if clearLevel > 1 then --clearLevel이 1이하라는 뜻은 아무것도 클리어하지 못해거나 클리어하지 못하고 죽었다는 뜻. 때문에 클리어/데스의 경우는 이 경우에만 적용해야만 함.
   		if checkClearOrDeath then
      		WhenStageClearSetting()
      		checkClearOrDeath = false
    	end
 	end
end

function WhenStageClearSetting()
	portalBlock = false 
    firstTalkWithBlacksmith = true
end


function DrawBackToVillage()
  love.graphics.setColor(0,0,0,255) -- 검은색 RGBA
  DrawRectangle(80, 5, 110, 57)
  love.graphics.setColor(255,255,255,255)
  love.graphics.rectangle("fill", 162, 12, 216, 110)

  love.graphics.setColor(0,0,0,255) -- 검은색 RGBA
  love.graphics.print("마을로 이동하시겠습니까?", 170, 25)

  love.graphics.print("이동하시려면 'enter'키를 눌러주세요.",168, 90)
end

function InitWhenClear() --클리어했을때 초기화.
	algoCheck = false; 	bubbleTipCheck = false; bpopupCheck = false; needOverwork = false;
	questCheck = false; blacksmithCheck = false; bossTalkCheck = false; tutorialStart = false;
	askSave = false

	talkCount = 1
end

function InitEverything() --죽었을 때 초기화.
	algoCheck = false; 	bubbleTipCheck = false; bossClearCheck = false;
	printBossClear = false; popupCheck = false; questCheck = false;
	blacksmithCheck = false; bossTalkCheck = false; tutorialStart = false; needOverwork = false;
	askSave = false

	multipleChoice = 1
	talkCount = 1
	sortControl = 1
end