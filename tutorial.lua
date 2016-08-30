tutorialStart = false
tutorialProgressLevel = 1 --1은 기본. 2는 용사집. 3은 대장간. 4는 다시 장로와 대화.

talkCountWithElder = 1
talkCountAtHome = 1

tutorialTalkList = {}

-- ※ 튜토리얼 활성화 하기 전에는 포탈 못타게 막아놓을 것.

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
			if tutorialProgressLevel == 1 then
				talkCountWithElder = talkCountWithElder + 1
			elseif tutorialProgressLevel == 2 then
				if talkCountAtHome == 1 then
					talkCountAtHome = talkCountAtHome + 1
				else
					tutorialStart = false
					tutorialProgressLevel = tutorialProgressLevel + 1
				end
			end
		end
		if love.keyboard.isDown('escape') then
			--esc누르면 튜토리얼 취소.
			tutorialStart = false
			talkCountWithElder = 1
		end
	end

	end --if stageLevel == 0
end

function StartTutorial()
	love.graphics.setColor(0,0,0,255)
	if talkCountWithElder == 1 then
		--맨 처음에만 리스트에 추가할 수 있도록.
		tutorialTalkList = {WarriorTalk1, ElderTalk1, WarriorTalk2, ElderTalk2, 
		WarriorTalk3, ElderTalk3, WarriorTalk4, ElderTalk4,WarriorTalk5, ElderTalk5}
	end

	if talkCountWithElder < 11 and tutorialProgressLevel == 1 then
		if talkCountWithElder % 2 == 0 then--짝수, 즉 마왕이 말할 때
		 	ElderTalkBackground()
		else --용사가 말할 때
		 	WarriorTalkBackgroundAtVillage()
		end
		tutorialTalkList[talkCountWithElder]()
	elseif tutorialProgressLevel == 2 then
		ElderTalkBackground()
		if talkCountAtHome == 1 then
			ElderTalkAboutHome1()
		else 
			ElderTalkAboutHome2()
		end
	else --대화가 끝난 후.
		tutorialStart = false
		tutorialProgressLevel = tutorialProgressLevel + 1
	end
	
	love.graphics.setColor(255,255,255,255)
end

function CheckTutorial()
	--가을 보스스테이지.
	if stageLevel == 0 and pl:GetX() == 60 and tutorialProgressLevel == 2 then --일정 좌표 넘어가서 대화 이벤트 발생.
		tutorialStart = true
	end
end

----------------------이하 대화내용

function ElderTalkAboutHome1()
 	love.graphics.print("너의 집에서는 지금까지", 365, 32)
 	love.graphics.print("했던 모험에 대한 기록이", 365, 52)
 	love.graphics.print("가능하단다!", 365, 72)
 	love.graphics.print("아! 그리고 중요한 말을", 365, 92)
 	love.graphics.print("빼먹을뻔 했구나!", 365, 112)
end

function ElderTalkAboutHome2()
 	love.graphics.print("마왕을 무찌르는데 필요한", 365, 32)
 	love.graphics.print("물건을 대장장이에게 맡겨", 365, 52)
 	love.graphics.print("놨으니 빨간 지붕의", 365, 72)
 	love.graphics.print("대장간으로 가서", 365, 92)
 	love.graphics.print("물건을 받아오거라!", 365, 112)

end


function WarriorTalk1()
 	love.graphics.print("장로님!", 115, 32)
 	love.graphics.print("안녕하세요?", 115, 52)
 	--love.graphics.print("Warrior Part1.", 115, 72)
end

function ElderTalk1()
 	love.graphics.print("오, 알! 어서오거라", 365, 32)
 	love.graphics.print("잘 지내고 있느냐?", 365, 52)
 	--love.graphics.print("Elder Talk 1", 365, 72)
end

function WarriorTalk2()
 	love.graphics.print("응, 아니요.", 115, 32)
end

function ElderTalk2()
 	love.graphics.print("썩을놈의 새끼..", 365, 32)
end

function WarriorTalk3()
 	love.graphics.print("3", 115, 32)
 	--love.graphics.print("Warrior Part1.", 115, 52)
 	--love.graphics.print("Warrior Part1.", 115, 72)
end

function ElderTalk3()
 	love.graphics.print("33", 365, 32)
 	--love.graphics.print("Elder Talk 1", 365, 52)
 	--love.graphics.print("Elder Talk 1", 365, 72)
end

function WarriorTalk4()
 	love.graphics.print("4", 115, 32)
 	--love.graphics.print("Warrior Part1.", 115, 52)
 	--love.graphics.print("Warrior Part1.", 115, 72)
end

function ElderTalk4()
 	love.graphics.print("44", 365, 32)
 	--love.graphics.print("Elder Talk 1", 365, 52)
 	--love.graphics.print("Elder Talk 1", 365, 72)
end

function WarriorTalk5()
 	love.graphics.print("55", 115, 32)
 	--love.graphics.print("Warrior Part1.", 115, 52)
 	--love.graphics.print("Warrior Part1.", 115, 72)
end

function ElderTalk5()
 	love.graphics.print("자! 파란지붕인 너의 집으로", 365, 32)
 	love.graphics.print("가서 확인해보거라", 365, 52)
 	--love.graphics.print("Elder Talk 1", 365, 72)
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