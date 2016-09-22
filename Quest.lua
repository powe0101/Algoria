--Quest.lua 및 관련 함수 추가. by.현식 0802
local self={}
setmetatable(self,Control)
phase = 0 --표지판을 통한 퀘스트 단계. 다리가 3번 열려야 하니 페이즈는 총 3단계가 존재. by.현식 0802
multipleChoice = 1

questList = {} --문제 이미지를 담기 위한 리스트.

bubbleTipCount = 1

function CheckQuest(_x,_y)
	self.x=_x
	self.y=_y
  -- body
  if love.keyboard.isDown('up') then
  	if stageLevel == 1 then
  		if self.x-8 < pl:GetX() and pl:GetX() < self.x+8  then --봄에서의 표지퐌 자표를 입력해주면 됨. by.현식 0803
      		questCheck = true
    	end
    elseif stageLevel == 2     then --근영 여름 08 11

        	if picketList[2].x-20 < pl:GetX() and pl:GetX() < picketList[2].x+15 and phase == 3
        		and picketList[2].y-10< pl:GetY() and pl:GetY() < picketList[2].y+10 then --3단계
      		questCheck = true
      		pl:StartMaze()
    	elseif picketList[1].x-20 < pl:GetX() and pl:GetX() < picketList[1].x+15 and phase == 2
    			and picketList[1].y-10< pl:GetY() and pl:GetY() < picketList[1].y+10  then
    		questCheck = true
    		pl:StartMaze()
    	elseif picketList[0].x-20 < pl:GetX() and pl:GetX() < picketList[0].x+15 and phase == 1
    			and picketList[0].y-10< pl:GetY() and pl:GetY() < picketList[0].y+10 then
    		questCheck = true
    	end
  	elseif stageLevel == 3 then --가을
    	if 215 < pl:GetX() and pl:GetX() < 225 and phase == 3 then --3단계
      		questCheck = true
    	elseif 337 < pl:GetX() and pl:GetX() < 347 and phase == 2 then
    		questCheck = true
    	elseif 520 < pl:GetX() and pl:GetX() < 530 and phase == 1 then
    		questCheck = true
    	end
    end
    elseif  stageLevel==4 then --근영 여름 08 11

        	if picketList[2].x-20 < pl:GetX() and pl:GetX() < picketList[2].x+15 and phase == 3
        		and picketList[2].y-10< pl:GetY() and pl:GetY() < picketList[2].y+10 then --3단계
      		questCheck = true
      		
    	elseif picketList[1].x-20 < pl:GetX() and pl:GetX() < picketList[1].x+15 and phase == 2
    			and picketList[1].y-10< pl:GetY() and pl:GetY() < picketList[1].y+10  then
    		questCheck = true
  
    	elseif picketList[0].x-20 < pl:GetX() and pl:GetX() < picketList[0].x+15 and phase == 1
    			and picketList[0].y-10< pl:GetY() and pl:GetY() < picketList[0].y+10 then
    		questCheck = true
    	end


  end
end

function DrawQuest() -- phase별로 문제를 그리게 됨.
	if stageLevel == 4 and phase > 1 then
		--겨울 문제는 다른 크기의 배경을 그림.
	else
		DrawQuestBackground()
	end

	love.graphics.setColor(255,255,255,255) -- 하얀색 RGBA로 마무리해야함.

	if stageLevel == 4 and phase > 1 then
		--겨울 문제는 다른 크기로 그림.
		love.graphics.draw(questList[GetQuestNum()],quest_winter_frame,70,12) --겨울은 프레임이랑 위치만 다르게 그리면 될 듯.
	else
		love.graphics.draw(questList[GetQuestNum()],quest_now_frame,70,12) --문제 그리기.
	end

  	if phase == 1 then
  		DrawTip()
  	elseif phase ==2 or phase ==3 then
  		if stageLevel ~= 4 then
  			DrawMultipleChoice()
  		elseif stageLevel == 4 then 
  			--겨울만 다른 크기로 그림
  		end
  	end

  	love.graphics.setColor(255,255,255,255) -- 하얀색 RGBA로 마무리해야함.
end

function DrawTip() --단순히 읽고 넘어갈 수 있는 팁방식.
	love.graphics.setColor(0,0,0,255)
	love.graphics.print("이해하셨다면, 'Enter'키를 눌러주세요!", 165, 152)
	love.graphics.setColor(255,255,255,255)
end

function DrawBubbleSortTip()
	DrawTipBackground()
	DrawTip()

	if bubbleTipCount == 1 then
		--텍스트는 쓰는걸로 ??
		love.graphics.draw(bubbleTip1,tip_now_frame,40,12)
	elseif bubbleTipCount == 2 then
		love.graphics.draw(bubbleTip2,tip_now_frame,40,12)
	elseif bubbleTipCount == 3 then
		love.graphics.draw(bubbleTip3,tip_now_frame,40,12)
	else
		love.graphics.draw(bubbleTip4,tip_now_frame,40,12)
	end
end

function DrawMultipleChoice() --문제를 풀고 넘어가야 하는 객관식 방식. -- ~258 / 168
	if multipleChoice == 1 then
		DrawChoiceOne()
	elseif multipleChoice == 2 then
		DrawChoiceTwo()
	elseif multipleChoice == 3 then
		DrawChoiceThree()
	elseif multipleChoice == 4 then
		DrawChoiceFour()
	end
end

function DrawChoiceOne()
	--love.graphics.rectangle("line", 100,150,50, 30) --정답을 사각형으로 체크할 경우

	love.graphics.setColor(255,255,255,255) -- 하얀색 RGBA로 마무리해야함.
	love.graphics.draw(exampleList[GetAnswerNum()][1],answer_now_frame,100,145)
	love.graphics.draw(exampleList[GetAnswerNum()][2],answer_now_frame,200,145)
	love.graphics.draw(exampleList[GetAnswerNum()][3],answer_now_frame,300,145)
	love.graphics.draw(exampleList[GetAnswerNum()][4],answer_now_frame,400,145)
	--리스트 안에 리스트 테스트 성공. by.현식 0804

	love.graphics.setColor(255,0,0,255)
	love.graphics.ellipse("line", 113, 164, 6, 9, 100) -- 정답을 체크하는 원 그리기. ※0805. 후에 정답 이미지가 변경되면 좌표값이나 사이즈값을 수정할 필요가 있음.

	love.graphics.setColor(255,255,255,255) -- 하얀색 RGBA로 마무리해야함.
end

function DrawChoiceTwo()
	love.graphics.setColor(255,255,255,255) -- 하얀색 RGBA로 마무리해야함.
	love.graphics.draw(exampleList[GetAnswerNum()][1],answer_now_frame,100,145)
	love.graphics.draw(exampleList[GetAnswerNum()][2],answer_now_frame,200,145)
	love.graphics.draw(exampleList[GetAnswerNum()][3],answer_now_frame,300,145)
	love.graphics.draw(exampleList[GetAnswerNum()][4],answer_now_frame,400,145)

	love.graphics.setColor(255,0,0,255)
	love.graphics.ellipse("line", 213, 164, 6, 9, 100) -- 정답을 체크하는 원 그리기

	love.graphics.setColor(255,255,255,255) -- 하얀색 RGBA로 마무리해야함.
end

function DrawChoiceThree()
	love.graphics.setColor(255,255,255,255) -- 하얀색 RGBA로 마무리해야함.
	love.graphics.draw(exampleList[GetAnswerNum()][1],answer_now_frame,100,145)
	love.graphics.draw(exampleList[GetAnswerNum()][2],answer_now_frame,200,145)
	love.graphics.draw(exampleList[GetAnswerNum()][3],answer_now_frame,300,145)
	love.graphics.draw(exampleList[GetAnswerNum()][4],answer_now_frame,400,145)

	love.graphics.setColor(255,0,0,255)
	love.graphics.ellipse("line", 313, 164, 6, 9, 100) -- 정답을 체크하는 원 그리기

	love.graphics.setColor(255,255,255,255) -- 하얀색 RGBA로 마무리해야함.
end

function DrawChoiceFour()
	love.graphics.setColor(255,255,255,255) -- 하얀색 RGBA로 마무리해야함.
	love.graphics.draw(exampleList[GetAnswerNum()][1],answer_now_frame,100,145)
	love.graphics.draw(exampleList[GetAnswerNum()][2],answer_now_frame,200,145)
	love.graphics.draw(exampleList[GetAnswerNum()][3],answer_now_frame,300,145)
	love.graphics.draw(exampleList[GetAnswerNum()][4],answer_now_frame,400,145)

	love.graphics.setColor(255,0,0,255)
	love.graphics.ellipse("line", 413, 164, 6, 9, 100) -- 정답을 체크하는 원 그리기

	love.graphics.setColor(255,255,255,255) -- 하얀색 RGBA로 마무리해야함.
end


function ControlQuest()
	if questCheck or bubbleTipCheck then
	    if stageLevel == 2 then
	    	SummerQuest()
	    elseif stageLevel == 3 then
	    	FallQuest()

	    elseif stageLevel == 4 then
	    	WinterQuest()
	    end

	    if love.keyboard.isDown("escape") then -- esc누르면 아무일도 일어나지 않고 퀘스트창이 닫힘.
	      questCheck = false
	      multipleChoice = 1
	    end
	end
end

function GetQuestNum() --리스트에서 몇 번 문제인지 뽑아내기 위한 함수. by.현식 0805
	if stageLevel == 1 then
		return phase
	elseif stageLevel == 2 then
		return phase + 3
	elseif stageLevel == 3 then
		return phase + 6
	elseif stageLevel == 4 then
		return phase + 9
	end
end

function ControlLeftRight()
	if love.keyboard.isDown("left") then
	   		if multipleChoice == 1 then
		   	--1번 선택지에서 왼쪽으로 가면 아무 동작도 안함.
	   	else
	   		multipleChoice = multipleChoice - 1
	   	end
	end

    if love.keyboard.isDown("right") then
    		if multipleChoice == 4 then
    		--4번 선택지에서 오른쪽으로 가면 아무 동작도 안함.
    	else
    		multipleChoice = multipleChoice + 1
    	end
    end
end

function SummerQuest() --여름 스테이지에서의 좌표 및 컨트롤 하는 메서드
		if phase == 1 then --1번째는 Tip.
	    	if love.keyboard.isDown("return") then --enter키임.
	      		questCheck = false
	      		phase = phase + 1
	      		qmarkCheck = true
	      	end
	    
	    end
end

function WinterQuest() --여름 스테이지에서의 좌표 및 컨트롤 하는 메서드
		if phase == 1 then --1번째는 Tip.
	    	if love.keyboard.isDown("return") then --enter키임.
	      		questCheck = false
	      		phase = phase + 1
	      		qmarkCheck = true
	      	end
	    elseif phase == 2 and stageLevel~=2 then --2번째 객관식 문제.
	    	ControlLeftRight()

    		if love.keyboard.isDown("return") then --enter키임.
    			--이하는 정답일 경우에만. 정답인지 아닌지를 가리기 위해서는 이걸 테이블로 만드는게 나을 것 같음.
    			if answerList[GetAnswerNum()] == multipleChoice then --정답을 미리 리스트에 넣어넣고 일치하는지 여부를 확인. by. 현식 0804
    				--정답을 맞췄을 경우
    				questCheck = false
			      	phase = phase + 1
			      	multipleChoice = 1
			      	qmarkCheck = true
		      	else
		      		--오답일 경우
		      		LifeMinus()
		      	end

	      	end
	    elseif phase == 3 then --3번째 객관식 문제
	      	ControlLeftRight()

    		if love.keyboard.isDown("return") then --enter키임.
    			--이하는 정답일 경우에만. 정답인지 아닌지를 가리기 위해서는 이걸 테이블로 만드는게 나을 것 같음.
    			if answerList[GetAnswerNum()] == multipleChoice then --정답을 미리 리스트에 넣어넣고 일치하는지 여부를 확인. by. 현식 0804
    				--정답을 맞췄을 경우
		      		questCheck = false
		      		phase = 4
		      		canPass = true
		      		multipleChoice = 1
		      		qmarkCheck = true
		      		
		      		groundList[0]:SetY(-320) -- ground의 y 값을 변경
		      		groundList[1]:SetY(-320) -- ground의 y 값을 변경
		      		BoxListDelete()
		      		CreateBackGround(-50,200)
					CreateBackGround(550,200)
					CreateBackGround(-50,-200)
					CreateBackGround(550,-200)
		      		pl.player_ground_y = 335
		      	else
		      		--오답일 경우
		      		LifeMinus()
		      	end
	      	end
	    end
end

function FallQuest() --가을 스테이지에서의 좌표 및 컨트롤 하는 메서드
		if bubbleTipCheck then --가을에만 있는 버블소트를 위한 팁 제공
			if love.keyboard.isDown("return") then --enter키임.
	      		if bubbleTipCount == 1 then
	      			bubbleTipCount = bubbleTipCount + 1
	      			love.timer.sleep(0.3)
	      		elseif bubbleTipCount == 2 then
	      			bubbleTipCount = bubbleTipCount + 1
	      			love.timer.sleep(0.3)
	      		elseif bubbleTipCount == 3 then
	      			bubbleTipCount = bubbleTipCount + 1
	      			love.timer.sleep(0.3)
	      		else
	      			bubbleTipCount = 1
	      			bubbleTipCheck = false
	      		end
	      	end
	    elseif phase == 1 then --1번째는 Tip.
	    	if love.keyboard.isDown("return") then --enter키임.
	      		questCheck = false
	      		phase = phase + 1
	      		BridegePassValue = BridegePassValue + 185
	      		qmarkCheck = true
	      	end
	    elseif phase == 2 then --2번째 객관식 문제.
	    	ControlLeftRight()

    		if love.keyboard.isDown("return") then --enter키임.
    			--이하는 정답일 경우에만. 정답인지 아닌지를 가리기 위해서는 이걸 테이블로 만드는게 나을 것 같음.
    			if answerList[GetAnswerNum()] == multipleChoice then --정답을 미리 리스트에 넣어넣고 일치하는지 여부를 확인. by. 현식 0804
    				--정답을 맞췄을 경우

    					--가을은 2번째 퀘스트를 해결했을 경우, 바로 다음으로 넘어가지 않고 버블소트에 대한 팁을 제공한다.
    					bubbleTipCheck = true

    					questCheck = false
			      		phase = phase + 1
			      		BridegePassValue = BridegePassValue + 109
			      		multipleChoice = 1
			      		qmarkCheck = true
		      	else
		      		--오답일 경우
		      		LifeMinus()
		      	end
		      	love.timer.sleep(0.3) --enter키 연속눌림 방지.
	      	end
	    elseif phase == 3 and bubbleTipCheck == false then --3번째 객관식 문제
	      	ControlLeftRight()

    		if love.keyboard.isDown("return") then --enter키임.
    			--이하는 정답일 경우에만. 정답인지 아닌지를 가리기 위해서는 이걸 테이블로 만드는게 나을 것 같음.
    			if answerList[GetAnswerNum()] == multipleChoice then --정답을 미리 리스트에 넣어넣고 일치하는지 여부를 확인. by. 현식 0804
    				--정답을 맞췄을 경우
		      		questCheck = false
		      		phase = 4
		      		canPass = true
		      		multipleChoice = 1
		      		qmarkCheck = true
		      	else
		      		--오답일 경우
		      		--추후에 오답일 경우에는 체력 게이지가 닳도록 만들기.
		      		LifeMinus()
		      	end
	      	end
	    end
end

function DrawQuestBackground()
	love.graphics.setColor(0,0,0,255) -- 검은색 RGBA
  	DrawRectangle(30, 5, 250, 85) --검은색 테두리
  	love.graphics.setColor(255,255,255,255)
  	love.graphics.rectangle("fill", 62, 12, 496, 166) --테두리 안에 흰색 도화지?
end

function DrawTipBackground()
	love.graphics.setColor(0,0,0,255) -- 검은색 RGBA
  	DrawRectangle(15, 5, 271, 85) --검은색 테두리
  	love.graphics.setColor(255,255,255,255)
  	love.graphics.rectangle("fill", 32, 12, 538, 166) --테두리 안에 흰색 도화지?
end

function QuestLoad() --틀은 만들어놨으니 나중에 이미지만 바꾸면 그대로 적용할 수 있음.
	--봄 퀘스트
	springPhase1Quest = love.graphics.newImage("images/quest/spring_phase1_quest.png") --그림판으로 작업한 임시 문제
	springPhase1Quest:setFilter("nearest","nearest")
	springPhase2Quest = love.graphics.newImage("images/quest/spring_phase2_quest.png") --그림판으로 작업한 임시 문제
	springPhase2Quest:setFilter("nearest","nearest")
	springPhase3Quest = love.graphics.newImage("images/quest/spring_phase3_quest.png") --그림판으로 작업한 임시 문제
	springPhase3Quest:setFilter("nearest","nearest")

	--여름 퀘스트
	summerPhase1Quest = love.graphics.newImage("images/quest/summer_phase1_quest.png") --그림판으로 작업한 임시 문제
	summerPhase1Quest:setFilter("nearest","nearest")
	summerPhase2Quest = love.graphics.newImage("images/quest/summer_phase2_quest.png") --그림판으로 작업한 임시 문제
	summerPhase2Quest:setFilter("nearest","nearest")
	summerPhase3Quest = love.graphics.newImage("images/quest/summer_phase3_quest.png") --그림판으로 작업한 임시 문제
	summerPhase3Quest:setFilter("nearest","nearest")

	--가을 퀘스트
	fallPhase1Quest = love.graphics.newImage("images/quest/fall_phase1_quest.png") 
	fallPhase1Quest:setFilter("nearest","nearest")
	fallPhase2Quest = love.graphics.newImage("images/quest/fall_phase2_quest.png") 
	fallPhase2Quest:setFilter("nearest","nearest")
	fallPhase3Quest = love.graphics.newImage("images/quest/fall_phase3_quest.png") 
	fallPhase3Quest:setFilter("nearest","nearest")

	--겨울 퀘스트
	winterPhase1Quest = love.graphics.newImage("images/quest/winter_phase1_quest.png") --그림판으로 작업한 임시 문제
	winterPhase1Quest:setFilter("nearest","nearest")
	winterPhase2Quest = love.graphics.newImage("images/quest/winter_phase2_quest.png") --그림판으로 작업한 임시 문제
	winterPhase2Quest:setFilter("nearest","nearest")
	winterPhase3Quest = love.graphics.newImage("images/quest/winter_phase3_quest.png") --그림판으로 작업한 임시 문제
	winterPhase3Quest:setFilter("nearest","nearest")

	quest_now_frame =  love.graphics.newQuad(0,0, 481, 121, 481, 121) --이 사이즈가 딱 맞음.
	quest_winter_frame = love.graphics.newQuad(0,0, 481, 280, 481, 280) 

	questList = {springPhase1Quest,springPhase2Quest,springPhase3Quest,
				summerPhase1Quest, summerPhase2Quest, summerPhase3Quest,
				fallPhase1Quest, fallPhase2Quest, fallPhase3Quest,
				winterPhase1Quest, winterPhase2Quest, winterPhase3Quest}
end

function BubbleTipLoad()
	bubbleTip1 = love.graphics.newImage("images/quest/Tip/fall_bubble_tip1.png")
	bubbleTip1:setFilter("nearest","nearest")

	bubbleTip2 = love.graphics.newImage("images/quest/Tip/fall_bubble_tip2.png")
	bubbleTip2:setFilter("nearest","nearest")

	bubbleTip3 = love.graphics.newImage("images/quest/Tip/fall_bubble_tip3.png")
	bubbleTip3:setFilter("nearest","nearest")

	bubbleTip4 = love.graphics.newImage("images/quest/Tip/fall_bubble_tip4.png")
	bubbleTip4:setFilter("nearest","nearest")

	tip_now_frame = love.graphics.newQuad(0,0, 528, 136, 528, 136)
end