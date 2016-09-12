returnToVillage = false
--298 328

function ControlBackToVillage()
	if stageLevel > 4 and bossClearCheck and 298 < pl:GetX() and pl:GetX() < 328 then
		if love.keyboard.isDown('up') then
			returnToVillage = true
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
	AllMakeFalse()

	bossClearCheck = false
	returnToVillage = false

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

function DrawBackToVillage()
  love.graphics.setColor(0,0,0,255) -- 검은색 RGBA
  DrawRectangle(80, 5, 110, 57)
  love.graphics.setColor(255,255,255,255)
  love.graphics.rectangle("fill", 162, 12, 216, 110)

  love.graphics.setColor(0,0,0,255) -- 검은색 RGBA
  love.graphics.print("마을로 이동하시겠습니까?", 170, 25)

  love.graphics.print("이동하시려면 'enter'키를 눌러주세요.",168, 90)
end

function AllMakeFalse() --사실상 Init임..
	algoCheck = false; 	bubbleTipCheck = false; bpopupCheck = false; 
	questCheck = false; blacksmithCheck = false; bossTalkCheck = false; tutorialStart = false;
end

function InitEverything()
	algoCheck = false; 	bubbleTipCheck = false; bossClearCheck = false;
	printBossClear = false; popupCheck = false; questCheck = false;
	blacksmithCheck = false; bossTalkCheck = false; tutorialStart = false;

	multipleChoice = 1
	talkCount = 1
	sortControl = 1
end