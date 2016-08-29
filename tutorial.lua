tutorialLevel = 1 --튜토리얼 끝나면 false로 바꿔줄 것.
tutorialStart = false
progressCount = 1

tutorialTalkList = {}

function ControlTutorial()
	--마을에서 동작하는 튜토리얼
	if stageLevel == 0 then
		if 275 < pl:GetX() and pl:GetX() < 285 then
			if love.keyboard.isDown('up') then
				tutorialStart = true
			end
		end

	if tutorialStart then --튜토리얼이 동작할때 사용되는 것들.
		if love.keyboard.isDown('return') then
			progressCount = progressCount + 1
		end
		if love.keyboard.isDown('escape') then
			--esc누르면 튜토리얼 취소.
			tutorialStart = false
		end
	end

	end --if stageLevel == 0
end

function StartTutorial()
	love.graphics.setColor(0,0,0,255)
	if progressCount == 1 then
		--맨 처음에만 리스트에 추가할 수 있도록.
		tutorialTalkList = {WarriorTalk1, ElderTalk1}
	end

	if progressCount % 2 == 0 then--짝수, 즉 마왕이 말할 때
	 	ElderTalkBackground()
	else --용사가 말할 때
	 	WarriorTalkBackgroundAtVillage()
	end

	tutorialTalkList[progressCount]()
	
	love.graphics.setColor(255,255,255,255)
end

function WarriorTalk1()
 	love.graphics.print("Warrior Part1.", 115, 32)
 	love.graphics.print("Warrior Part1.", 115, 52)
 	love.graphics.print("Warrior Part1.", 115, 72)
end

function ElderTalk1()
 	love.graphics.print("Elder Talk 1", 365, 32)
 	love.graphics.print("Elder Talk 1", 365, 52)
 	love.graphics.print("Elder Talk 1", 365, 72)
end

function ElderTalkBackground()
	love.graphics.setColor(0,0,0,255) -- 검은색 RGBA
	DrawRectangle(180, 15, 80, 60)
	love.graphics.setColor(255,255,255,255)
	love.graphics.rectangle("fill", 362, 32, 156, 116) 
	love.graphics.setColor(0,0,0,255) -- 검은색 RGBA
end

function WarriorTalkBackgroundAtVillage()
	love.graphics.setColor(0,0,0,255) -- 검은색 RGBA
	DrawRectangle(55, 15, 80, 60)
  	love.graphics.setColor(255,255,255,255)
	love.graphics.rectangle("fill", 112, 32, 156, 116)
	love.graphics.setColor(0,0,0,255) -- 검은색 RGBA	
end