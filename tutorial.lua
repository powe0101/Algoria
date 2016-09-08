--튜토리얼의 전제는 오프닝에서 마왕이 처들어왔고, 마왕을 무찔러야 한다는 전제가 있어야함.

tutorialStart = false
tutorialProgressLevel = 5 --1은 기본. 2는 용사집. 3은 포탈. 4는 대장장이. 5는 다시 장로와의 대화.

talkCountWithElder = 1
talkCountAtHome = 1
talkCountAtPortal = 1
talkCountAtBlackSmith = 1

tutorialTalkList = {}
tutorialTipList = {}

talkInit = true
multipleTutorialChoice = 1 --4지선다형 퀘스트를 컨트롤 하기 위한 변수.
correctTutorialAnswer = 1 --정답을 대조하기 위한 변수

portalBlock = true --튜토리얼을 끝내기 전에는 포탈을 탈 수 없도록 막아놓음.

-- ※ 튜토리얼 활성화 하기 전에는 포탈 못타게 막아놓을 것.

function ControlTutorial()
	--마을에서 동작하는 튜토리얼
	if stageLevel == 0 then
		if tutorialProgressLevel == 1 and 275 < pl:GetX() and pl:GetX() < 285 then
			if love.keyboard.isDown('up') then --엔터키도 넣으면 좋은데 or love.keyboard.isDown('return') then
				tutorialStart = true
			end
		elseif tutorialProgressLevel == 5 and 275 < pl:GetX() and pl:GetX() < 285 then
			if love.keyboard.isDown('up') then --엔터키도 넣으면 좋은데 or love.keyboard.isDown('return') then
				tutorialStart = true
			end
		end

		--※중요, 맨 처음 clearLevel을 1값을 줬고 그 이후로 스테이지 레벨에 따라 증가하므로 최초 1회에만 실행시키는 튜토리얼을 위해서는 clearLevel은 1이라는 조건문이 필요. by.현식 0902
	if tutorialStart and clearLevel == 1 then --튜토리얼이 동작할때 사용되는 것들.
		if love.keyboard.isDown('return') then
			if tutorialProgressLevel == 1 then
				talkCountWithElder = talkCountWithElder + 1
			elseif tutorialProgressLevel == 2 then
				if talkCountAtHome == 1 then
					talkCountAtHome = talkCountAtHome + 1
				else
					tutorialStart = false
					tutorialProgressLevel = tutorialProgressLevel + 1
					--tutorialProgressLevel = 5
				end
			elseif tutorialProgressLevel == 3 then
				if talkCountAtPortal == 1 or talkCountAtPortal == 2 then
					talkCountAtPortal = talkCountAtPortal + 1
				else
					tutorialStart = false
					tutorialProgressLevel = tutorialProgressLevel + 1
				end
			elseif tutorialProgressLevel == 4 then
				if talkCountAtBlackSmith == 1 or talkCountAtBlackSmith == 2 then
					talkCountAtBlackSmith = talkCountAtBlackSmith + 1
				else
					tutorialStart = false
					tutorialProgressLevel = tutorialProgressLevel + 1
				end
			elseif tutorialProgressLevel == 5 then
				if talkCountWithElder == 8 then
					if multipleChoice == correctTutorialAnswer then
						--정답일 경우.
						tutorialProgressLevel = 6
						multipleChoice = 1 --초기화
						portalBlock = true --튜토리얼이 다 끝나면 포탈을 탈 수 있게됨.
					end
				else
					talkCountWithElder = talkCountWithElder + 1
				end
			end
		end
		if love.keyboard.isDown('escape') then
			--esc누르면 튜토리얼 취소.
			tutorialStart = false
			talkCountWithElder = 1
		end
		if tutorialProgressLevel == 5 and talkCountWithElder == 8 then
			ControlLeftRight()
		end
	end

	end --if stageLevel == 0
end

function StartTutorial()
	love.graphics.setColor(0,0,0,255)
	if talkCountWithElder == 1 and tutorialProgressLevel ~= 5 then
		--맨 처음에만 리스트에 추가할 수 있도록.
		tutorialTalkList = {WarriorTalk1, ElderTalk1, WarriorTalk2, ElderTalk2, 
		WarriorTalk3, ElderTalk3, WarriorTalk4, ElderTalk4,WarriorTalk5, ElderTalk5}
	elseif tutorialProgressLevel == 5 and talkInit then
		talkCountWithElder = 1
		tutorialTalkList = {}
		tutorialTalkList = {AfterElderTalk1,AfterWarroirTalkAtVillage1,AfterElderTalk2,
		AfterElderTalk3, AfterElderTalk4}
		talkInit = false
	end

	if talkCountWithElder < 11 and tutorialProgressLevel == 1 then --장로
		if talkCountWithElder % 2 == 0 then--짝수, 즉 마왕이 말할 때
		 	ElderTalkBackground()
		else --용사가 말할 때
		 	WarriorTalkBackgroundAtVillage()
		end
		tutorialTalkList[talkCountWithElder]()
	elseif tutorialProgressLevel == 2 then -- 용사집
		ElderTalkBackground()
		if talkCountAtHome == 1 then
			ElderTalkAtHome1()
		else 
			ElderTalkAtHome2()
		end
	elseif tutorialProgressLevel == 3 then --포탈
		ElderTalkBackground() 
		if talkCountAtPortal == 1 then
			ElderTalkAtProtal1()
		elseif talkCountAtPortal == 2 then
			ElderTalkAtProtal2()
		else
			ElderTalkAtProtal3()
		end
	elseif tutorialProgressLevel == 4 then --대장장이
		BlackSmithTalkBackground()
		if talkCountAtBlackSmith == 1 then
			BlacksmtihTalk1()
		elseif talkCountAtBlackSmith == 2 then
			BlacksmtihTalk2()
		else 
			BlacksmtihTalk3()
		end
	elseif tutorialProgressLevel == 5 then
		if talkCountWithElder == 8 then
			ElderTalkBackground()
			FinalElderTalk()
		elseif talkCountWithElder > 5 then
			--팁과 문제풀이 부분.
			DrawTipAndQuest()
		elseif talkCountWithElder == 2 then -- 용사가 말할 때
		 	WarriorTalkBackgroundAtVillage()
		 	tutorialTalkList[talkCountWithElder]()
		else --장로가 말할 때
		 	ElderTalkBackground()
		 	tutorialTalkList[talkCountWithElder]()
		end
	else --대화가 끝난 후.
		tutorialStart = false
		tutorialProgressLevel = tutorialProgressLevel + 1
		qmarkCheckAtVillage = true
	end
	
	love.graphics.setColor(255,255,255,255)
end

function CheckTutorial()
	if stageLevel == 0 and pl:GetX() == 60 and tutorialProgressLevel == 2 then --일정 좌표 넘어가서 대화 이벤트 발생.
		tutorialStart = true
	elseif stageLevel == 0 and pl:GetX() == 180 and tutorialProgressLevel == 3 then
		tutorialStart = true
	elseif stageLevel == 0 and pl:GetX() == 440 and tutorialProgressLevel == 4 then
		tutorialStart = true 
	end
end

function BlackSmithTalkBackground()
	love.graphics.setColor(0,0,0,255) -- 검은색 RGBA
	DrawRectangle(175, 12, 80, 60)
	love.graphics.setColor(255,255,255,255)
	love.graphics.rectangle("fill", 352, 26, 156, 116) 
	love.graphics.setColor(0,0,0,255) -- 검은색 RGBA
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

function DrawTipAndQuest()
	if talkCountWithElder < 8 then --tip1,2
		DrawTipBackground()
		--love.graphics.draw(tutorialTipList[talkCountWithElder-5],tip_now_frame,70,12) --문제 그리기.
		love.graphics.setColor(0,0,0,255)
		if talkCountWithElder == 6 then
			ElderTipTalk1()
		elseif talkCountWithElder == 7 then
			ElderTipTalk2()
		end
		love.graphics.setColor(255,255,255,255)
	else -- 종료
	end
end