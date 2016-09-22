-- 0811. 현식 추가.
-- 보스와 대화하는 기능과 관련된 루아파일.

talkCount = 1 --대화 진행을 위한 변수.

function CheckBossMeeting()
	--보스 스테이지에서 보스와의 대화 활성화.
	if pl and stageLevel > 4 and 200 < pl:GetX() and bossClearCheck == false then
		bossTalkCheck = true
	end
end

function BossTalk()
	if talkCount < 7 then
	 	if talkCount % 2 == 0 then--짝수, 즉 마왕이 말할 때
	 		BossTalkBackground()
	 	else --용사가 말할 때
	 		WarriorTalkBackground()
	 	end
	 	bossTalkList[stageLevel-4][talkCount]()
	 end

 	love.graphics.setColor(255,255,255,255)
end

function BossTalkBackground()
	love.graphics.setColor(0,0,0,255) -- 검은색 RGBA
	DrawRectangle(200, 10, 80, 60)
	love.graphics.setColor(255,255,255,255)
	love.graphics.rectangle("fill", 402, 22, 156, 116)
	love.graphics.setColor(0,0,0,255) -- 검은색 RGBA
end

function WarriorTalkBackground()
	love.graphics.setColor(0,0,0,255) -- 검은색 RGBA
	DrawRectangle(20, 5, 80, 60)
  	love.graphics.setColor(255,255,255,255)
	love.graphics.rectangle("fill", 42, 12, 156, 116)
	love.graphics.setColor(0,0,0,255) -- 검은색 RGBA
end

function ControlTalkWithBoss()
	if playerDeadCheck == false and bossTalkCheck and stageLevel > 4 then
		if love.keyboard.isDown("return") then --enter키임
			if talkCount < 7 then
				talkCount = talkCount + 1
			end
			if talkCount == 7 then

				if stageLevel==6 then--미로 시작시 플레이어 좌표값 이동
					pl:StartMaze()
				end
				algoCheck = true
				love.timer.sleep(0.5)
			end
    end
    if love.keyboard.isDown("escape") then
    		--초기화 및 대화종료 여기서 폰트설정.
    	bossTalkCheck = false
		talkCount = 1
		pl.x = 200
			--컨트롤 좌표 수정하는 부분은 컨트롤에서 작업함.
    	end
	end
end
