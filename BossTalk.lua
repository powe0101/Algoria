-- 0811. 현식 추가. 
-- 보스와 대화하는 기능과 관련된 루아파일.

talkCount = 1 --대화 진행을 위한 변수.
talkList = {}

function CheckBossMeeting()
	--가을 보스스테이지.
	if stageLevel == 7 and 200 < pl:GetX() then --일정 좌표 넘어가서 대화 이벤트 발생.
		bossTalkCheck = true -- main에서의 update 중지.
	end
end

function BossTalk()
	talkList = {TalkOne,TalkTwo,TalkThree,TalkFour
				,TalkFive,TalkSix}
	if talkCount < 7 then
	 	if talkCount % 2 == 0 then--짝수, 즉 마왕이 말할 때
	 		BossTalkBackground()
	 	else --용사가 말할 때
	 		WarriorTalkBackground()
	 	end
	 		talkList[talkCount]()
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

function TalkOne() --Warrior Talk 1

 	love.graphics.print("I'm a warrior. I'll kill you.", 45, 20)
 	love.graphics.print("Yor're fucking idiot.", 45, 40)
 	love.graphics.print("Agree? Yes~ Agree~", 45, 60)
end

function TalkTwo() --Boss Talk 2

 	love.graphics.print("FUCKKKKKKKKKKKKKKKKK", 405, 22)
 	love.graphics.print("YOUUUUUUUUUUUUUUUUUU", 405, 42)
 	love.graphics.print("Agree? Yes~ Agree~", 405, 62)
end

function TalkThree() --Warrior Talk 2
 	love.graphics.print("Threeeeeeeeeeeeeeeeee", 45, 20)
 	love.graphics.print("Threeeeeeeeeeeeeeeeee", 45, 40)
 	love.graphics.print("Threeeeeeeeeeeeeeeeee", 45, 60)
end

function TalkFour() --Boss Talk 2
 	love.graphics.print("FUCKKKKKKKKKKKKKKKKK", 405, 22)
 	love.graphics.print("YOUUUUUUUUUUUUUUUUUU", 405, 42)
 	love.graphics.print("Agree? Yes~ Agree~", 405, 62)
end

function TalkFive() --Boss Talk 2
 	love.graphics.print("Fiveeeeeeeeeeeeee", 45, 20)
 	love.graphics.print("Fiveeeeeeeeeeeeeee", 45, 40)
 	love.graphics.print("Fiveeeeeeeeeeeeeeee", 45, 60)
end

function TalkSix() --Boss Talk 3
 	love.graphics.print("FUCKKKKKKKKKKKKKKKKK", 405, 22)
 	love.graphics.print("YOUUUUUUUUUUUUUUUUUU", 405, 42)
 	love.graphics.print("sixsixsix", 405, 62)
end

function ControlTalkWithBoss()
	if bossTalkCheck and stageLevel == 7 then
		if love.keyboard.isDown("return") then --enter키임
			if talkCount < 7 then
				talkCount = talkCount + 1
			end

			if talkCount == 7 then
				algoCheck = true
			end
    	end

    	if love.keyboard.isDown("escape") then
    		--초기화 및 대화종료
    		bossTalkCheck = false
			talkCount = 1
			pl.x = 200
    	end
	end
end