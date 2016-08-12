--Quest.lua 및 관련 함수 추가. by.현식 0802
local self={}
setmetatable(self,Control)
phase = 0 --표지판을 통한 퀘스트 단계. 다리가 3번 열려야 하니 페이즈는 총 3단계가 존재. by.현식 0802
multipleChoice = 1

questList = {} --문제 이미지를 담기 위한 리스트.

function CheckQuest(_x,_y)
	self.x=_x
	self.y=_y
  -- body
  if love.keyboard.isDown('up') then
  	if stageLevel == 1 then
  		if self.x-8 < pl:GetX() and pl:GetX() < self.x+8  then --봄에서의 표지퐌 자표를 입력해주면 됨. by.현식 0803
      		questCheck = true
    	end
    elseif stageLevl == 2 then --근영 여름 08 11
    	if self.x-10< pl:GetX() and pl:GetX() < self.x+10  then 
    		questCheck = true
        end
  	elseif stageLevel == 3 then --가을
    	if self.x-15< pl:GetX() and pl:GetX() < self.x+10 and phase == 3 then --3단계
      		questCheck = true
    	elseif self.x-15 < pl:GetX() and pl:GetX() < self.x+10 and phase == 2 then
    		questCheck = true
    	elseif self.x-15 < pl:GetX() and pl:GetX() < self.x+10 and phase == 1 then
    		questCheck = true
    	end
    end
  end
end

function DrawQuest() -- phase별로 문제를 그리게 됨.
	DrawQuestBackground()

  	love.graphics.draw(questList[GetQuestNum()],quest_now_frame,70,12) --문제 그리기.

  	if phase == 1 then
  		DrawTip()
  	elseif phase ==2 or phase ==3 then
  		--조건문을 걸어서 계절별/단계별로 문제를 어떻게 다르게 출력할 것인지 생각해봐야 할 듯. 
  		DrawMultipleChoice()
  	end

  	if fadeOn then --오답일 경우 오답이란 메시지를 페이드인으로 띄워줌. 
  		if fadeOnRight then --정답일 때도 만들수 있는데 구현은 안함. 딱히 필요 없을듯. by.0804 현식.
	  		love.graphics.setColor(255, 255, 255, fadeLight)
			love.graphics.draw(imgRightAnswer, wrong_now_frame, 50,50) --정답은 안쓰임
		elseif fadeOnWrong then --오답일 때 오답이라고 창 뜨는 것 외에도 라이프가 깍이면 좋겠음.
	  		love.graphics.setColor(255, 255, 255, fadeLight)
			love.graphics.draw(imgWrongAnswer, wrong_now_frame, 200,25)	
		end	
	end

  	love.graphics.setColor(255,255,255,255) -- 하얀색 RGBA로 마무리해야함.
end

function DrawTip() --단순히 읽고 넘어갈 수 있는 팁방식.
	love.graphics.setColor(0,0,0,255)

	love.graphics.print("If you understand, press enter", 165, 150) -- 한글깨짐. 폰트추가해야됨.
end

function DrawMultipleChoice() --문제를 풀고 넘어가야 하는 객관식 방식. -- ~258 / 168
	if multipleChoice == 1 then
		DrawChocieOne()
	elseif multipleChoice == 2 then
		DrawChocieTwo()
	elseif multipleChoice == 3 then
		DrawChocieThree()
	elseif multipleChoice == 4 then
		DrawChocieFour()
	end
end

function DrawChocieOne()
	--love.graphics.rectangle("line", 100,150,50, 30) --정답을 사각형으로 체크할 경우

	love.graphics.setColor(255,255,255,255) -- 하얀색 RGBA로 마무리해야함.
	love.graphics.draw(exampleList[GetAnswerNum()][1],answer_now_frame,100,145)
	love.graphics.draw(exampleList[GetAnswerNum()][2],answer_now_frame,200,145)
	love.graphics.draw(exampleList[GetAnswerNum()][3],answer_now_frame,300,145)
	love.graphics.draw(exampleList[GetAnswerNum()][4],answer_now_frame,400,145) 
	--리스트 안에 리스트 테스트 성공. by.현식 0804

	love.graphics.setColor(255,0,0,255)
	love.graphics.ellipse("line", 107, 158, 8, 8, 100) -- 정답을 체크하는 원 그리기. ※0805. 후에 정답 이미지가 변경되면 좌표값이나 사이즈값을 수정할 필요가 있음.

	love.graphics.setColor(255,255,255,255) -- 하얀색 RGBA로 마무리해야함.
end

function DrawChocieTwo()
	love.graphics.setColor(255,255,255,255) -- 하얀색 RGBA로 마무리해야함.
	love.graphics.draw(exampleList[GetAnswerNum()][1],answer_now_frame,100,145)
	love.graphics.draw(exampleList[GetAnswerNum()][2],answer_now_frame,200,145)
	love.graphics.draw(exampleList[GetAnswerNum()][3],answer_now_frame,300,145)
	love.graphics.draw(exampleList[GetAnswerNum()][4],answer_now_frame,400,145)

	love.graphics.setColor(255,0,0,255)
	love.graphics.ellipse("line", 207, 158, 8, 8, 100) -- 정답을 체크하는 원 그리기

	love.graphics.setColor(255,255,255,255) -- 하얀색 RGBA로 마무리해야함.
end

function DrawChocieThree()
	love.graphics.setColor(255,255,255,255) -- 하얀색 RGBA로 마무리해야함.
	love.graphics.draw(exampleList[GetAnswerNum()][1],answer_now_frame,100,145)
	love.graphics.draw(exampleList[GetAnswerNum()][2],answer_now_frame,200,145)
	love.graphics.draw(exampleList[GetAnswerNum()][3],answer_now_frame,300,145)
	love.graphics.draw(exampleList[GetAnswerNum()][4],answer_now_frame,400,145)

	love.graphics.setColor(255,0,0,255)
	love.graphics.ellipse("line", 307, 158, 7, 7, 100) -- 정답을 체크하는 원 그리기

	love.graphics.setColor(255,255,255,255) -- 하얀색 RGBA로 마무리해야함.
end

function DrawChocieFour()
	love.graphics.setColor(255,255,255,255) -- 하얀색 RGBA로 마무리해야함.
	love.graphics.draw(exampleList[GetAnswerNum()][1],answer_now_frame,100,145)
	love.graphics.draw(exampleList[GetAnswerNum()][2],answer_now_frame,200,145)
	love.graphics.draw(exampleList[GetAnswerNum()][3],answer_now_frame,300,145)
	love.graphics.draw(exampleList[GetAnswerNum()][4],answer_now_frame,400,145)

	love.graphics.setColor(255,0,0,255)
	love.graphics.ellipse("line", 407, 158, 7, 7, 100) -- 정답을 체크하는 원 그리기

	love.graphics.setColor(255,255,255,255) -- 하얀색 RGBA로 마무리해야함.
end


function ControlQuest() 
	if questCheck then
		if phase > 1 and love.keyboard.isDown("tab") then
	    	--아무키나 누르시오를 구현하기 위함.
	    else
	    	FadeOut() --오답일 경우 메시지가 뜨고난 다음, 그 메시지를 없애는 페이드아웃.
	    end

	    FallQuest()

	    if love.keyboard.isDown("escape") then -- esc누르면 아무일도 일어나지 않고 퀘스트창이 닫힘.
	      questCheck = false
	      multipleChoice = 1
	    end
	end
end

function QuestLoad() --틀은 만들어놨으니 나중에 이미지만 바꾸면 그대로 적용할 수 있음.
	--봄 퀘스트
	springPhase1Quest = love.graphics.newImage("images/quest/spring_phase1_quest.png") --그림판으로 작업한 임시 문제
	springPhase2Quest = love.graphics.newImage("images/quest/spring_phase2_quest.png") --그림판으로 작업한 임시 문제
	springPhase3Quest = love.graphics.newImage("images/quest/spring_phase3_quest.png") --그림판으로 작업한 임시 문제

	--여름 퀘스트
	summerPhase1Quest = love.graphics.newImage("images/quest/summer_phase1_quest.png") --그림판으로 작업한 임시 문제
	summerPhase2Quest = love.graphics.newImage("images/quest/summer_phase2_quest.png") --그림판으로 작업한 임시 문제
	summerPhase3Quest = love.graphics.newImage("images/quest/summer_phase3_quest.png") --그림판으로 작업한 임시 문제

	--가을 퀘스트
	fallPhase1Quest = love.graphics.newImage("images/quest/fall_phase1_quest.png") --그림판으로 작업한 임시 문제
	fallPhase2Quest = love.graphics.newImage("images/quest/fall_phase2_quest.png") --그림판으로 작업한 임시 문제
	fallPhase3Quest = love.graphics.newImage("images/quest/fall_phase3_quest.png") --그림판으로 작업한 임시 문제

	--겨울 퀘스트
	winterPhase1Quest = love.graphics.newImage("images/quest/winter_phase1_quest.png") --그림판으로 작업한 임시 문제
	winterPhase2Quest = love.graphics.newImage("images/quest/winter_phase2_quest.png") --그림판으로 작업한 임시 문제
	winterPhase3Quest = love.graphics.newImage("images/quest/winter_phase3_quest.png") --그림판으로 작업한 임시 문제

	quest_now_frame =  love.graphics.newQuad(0,0, 481, 121, 481, 121) --이 사이즈가 딱 맞음.

	questList = {springPhase1Quest,springPhase2Quest,springPhase3Quest,
				summerPhase1Quest, summerPhase2Quest, summerPhase3Quest,
				fallPhase1Quest, fallPhase2Quest, fallPhase3Quest,
				winterPhase1Quest, winterPhase2Quest, winterPhase3Quest}
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

function FallQuest() --가을 스테이지에서의 좌표 및 컨트롤 하는 메서드
	    if phase == 1 then --1번째는 Tip.
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
		      		questCheck = false
		      		phase = phase + 1
		      		BridegePassValue = BridegePassValue + 109
		      		multipleChoice = 1
		      		qmarkCheck = true
		      	else
		      		--오답일 경우
		      		fadeOn = true
		      		fadeOnWrong = true

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
		      	else
		      		--오답일 경우
		      		--추후에 오답일 경우에는 체력 게이지가 닳도록 만들기.
		      		fadeOn = true
		      		fadeOnWrong = true

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