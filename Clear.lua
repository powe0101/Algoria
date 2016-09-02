function StageClear()
	--슬립 적절한 위치에서 주는거랑 클리어할때 clearLevel 다시 배정하느거 수정할 것.
	love.timer.sleep(2)

	DeleteVillage()
	clearLevel = stageLevel - 3
	stageLevel = 0 --마을로 가니까.

	algoCheck = false
	bubbleTipCheck = false
	--테스팅
	popupCheck = false; questCheck = false; blacksmithCheck = false; 
	bossTalkCheck = false; tutorialStart = false;

	CreateTitleVillage(0)
end