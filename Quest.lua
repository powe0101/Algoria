--Quest.lua 및 관련 함수 추가. by.현식 0802

phase = 0 --표지판을 통한 퀘스트 단계. 다리가 3번 열려야 하니 페이즈는 총 3단계가 존재. by.현식 0802
multipleChoice = 1

answerList = {1,2,3,4,4,3,2,1}
--정답을 미리 정해놓고 이와 일치하는지 여부를 확인하기 위함.

questList = {} --문제 이미지를 담기 위한 리스트.
exampleList = {} --4지선다형을 담기 위한 리스트. 이건 리스트 안에 리스트를 넣어야 하나 ??
fallPhase2List = {}

function CheckQuest()
  -- body
  if love.keyboard.isDown('up') then
  	if stageLevel == 1 then
  		if 215 < pl:GetX() and pl:GetX() < 227 then --봄에서의 표지퐌 자표를 입력해주면 됨. by.현식 0803
      		questCheck = true
    	end
  	elseif stageLevel == 3 then --가을
    	if 290 < pl:GetX() and pl:GetX() < 330 and phase == 3 then --3단계
      		questCheck = true
    	elseif 365 < pl:GetX() and pl:GetX() < 380 and phase == 2 then
    		questCheck = true
    	elseif 440 < pl:GetX() and pl:GetX() < 455 and phase == 1 then
    		questCheck = true
    	end
    end
  end
end

function DrawQuest() -- phase별로 문제를 그리게 됨.
	love.graphics.setColor(0,0,0,255) -- 검은색 RGBA
  	DrawRectangle(30, 5, 250, 85) --검은색 테두리
  	love.graphics.setColor(255,255,255,255)
  	love.graphics.rectangle("fill", 62, 12, 496, 166) --테두리 안에 흰색 도화지?

  	if phase == 1 then
  		DrawTip()
  	elseif phase ==2 then
  		--조건문을 걸어서 계절별/단계별로 문제를 어떻게 다르게 출력할 것인지 생각해봐야 할 듯. 
  		love.graphics.draw(fallPhase2Quest,quest_now_frame,70,12) --테스트용
  		DrawMultipleChoice()
  	elseif phase ==3 then
  		
  	end

  	if fadeOn then --오답일 경우 오답이란 메시지를 페이드인으로 띄워줌. 
  		if fadeOnRight then --정답일 때도 만들수 있는데 구현은 안함. 딱히 필요 없을듯. by.0804 현식.
	  		love.graphics.setColor(255, 255, 255, fadeLight)
			love.graphics.draw(imgRightAnswer, wrong_now_frame, 50,50)
		elseif fadeOnWrong then --오답일 때 오답이라고 창 뜨는 것 외에도 라이프가 깍이면 좋겠음.
	  		love.graphics.setColor(255, 255, 255, fadeLight)
			love.graphics.draw(imgWrongAnswer, wrong_now_frame, 50,50)	
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
	love.graphics.draw(exampleList[1][1],answer_now_frame,100,150)
	love.graphics.draw(exampleList[1][2],answer_now_frame,200,150)
	love.graphics.draw(exampleList[1][3],answer_now_frame,300,150)
	love.graphics.draw(exampleList[1][4],answer_now_frame,400,150) 
	--리스트 안에 리스트 테스트 성공. by.현식 0804

	love.graphics.setColor(255,0,0,255)
	love.graphics.ellipse("line", 105, 159, 7, 7, 100) -- 정답을 체크하는 원 그리기

	love.graphics.setColor(255,255,255,255) -- 하얀색 RGBA로 마무리해야함.
end

function DrawChocieTwo()
	love.graphics.setColor(255,255,255,255) -- 하얀색 RGBA로 마무리해야함.
	love.graphics.draw(fallPhase2ans1,answer_now_frame,100,150)
	love.graphics.draw(fallPhase2ans2,answer_now_frame,200,150)
	love.graphics.draw(fallPhase2ans3,answer_now_frame,300,150)
	love.graphics.draw(fallPhase2ans4,answer_now_frame,400,150)

	love.graphics.setColor(255,0,0,255)
	love.graphics.ellipse("line", 205, 159, 7, 7, 100) -- 정답을 체크하는 원 그리기

	love.graphics.setColor(255,255,255,255) -- 하얀색 RGBA로 마무리해야함.
end

function DrawChocieThree()
	love.graphics.setColor(255,255,255,255) -- 하얀색 RGBA로 마무리해야함.
	love.graphics.draw(fallPhase2ans1,answer_now_frame,100,150)
	love.graphics.draw(fallPhase2ans2,answer_now_frame,200,150)
	love.graphics.draw(fallPhase2ans3,answer_now_frame,300,150)
	love.graphics.draw(fallPhase2ans4,answer_now_frame,400,150)

	love.graphics.setColor(255,0,0,255)
	love.graphics.ellipse("line", 305, 159, 7, 7, 100) -- 정답을 체크하는 원 그리기

	love.graphics.setColor(255,255,255,255) -- 하얀색 RGBA로 마무리해야함.
end

function DrawChocieFour()
	love.graphics.setColor(255,255,255,255) -- 하얀색 RGBA로 마무리해야함.
	love.graphics.draw(fallPhase2ans1,answer_now_frame,100,150)
	love.graphics.draw(fallPhase2ans2,answer_now_frame,200,150)
	love.graphics.draw(fallPhase2ans3,answer_now_frame,300,150)
	love.graphics.draw(fallPhase2ans4,answer_now_frame,400,150)

	love.graphics.setColor(255,0,0,255)
	love.graphics.ellipse("line", 405, 159, 7, 7, 100) -- 정답을 체크하는 원 그리기

	love.graphics.setColor(255,255,255,255) -- 하얀색 RGBA로 마무리해야함.
end


function ControlQuest() 
	if questCheck then
		if phase > 1 and love.keyboard.isDown("tab") then
	    	--아무키나 누르시오를 구현하기 위함.
	    else
	    	FadeOut() --오답일 경우 메시지가 뜨고난 다음, 그 메시지를 없애는 페이드아웃.
	    end

	    if phase == 1 then --1번째는 Tip.
	    	if love.keyboard.isDown("return") then --enter키임. 
	      		questCheck = false
	      		phase = phase + 1
	      		BridegePassValue = BridegePassValue + 29
	      	end
	    elseif phase == 2 then --2번째 객관식 문제.
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

    		if love.keyboard.isDown("return") then --enter키임. 
    			--이하는 정답일 경우에만. 정답인지 아닌지를 가리기 위해서는 이걸 테이블로 만드는게 나을 것 같음.
    			if answerList[stageLevel + phase -1] == multipleChoice then --정답을 미리 리스트에 넣어넣고 일치하는지 여부를 확인. by. 현식 0804
    				--정답을 맞췄을 경우
		      		questCheck = false
		      		phase = phase + 1
		      		BridegePassValue = BridegePassValue + 35
		      	else
		      		--오답일 경우
		      		fadeOn = true
		      		fadeOnWrong = true
		      	end
	      	end
	    end

	    if love.keyboard.isDown("escape") then -- esc누르면 아무일도 일어나지 않고 퀘스트창이 닫힘.
	      questCheck = false
	    end
	end
end

function FallQuestAndAnswerLoad()
	fallPhase2Quest = love.graphics.newImage("images/fall_phase2_quest.png") --그림판으로 작업한 임시 문제
	fallPhase2ans1 = love.graphics.newImage("images/fall_phase2_ans1.png")
	fallPhase2ans2 = love.graphics.newImage("images/fall_phase2_ans2.png")
	fallPhase2ans3 = love.graphics.newImage("images/fall_phase2_ans3.png")
	fallPhase2ans4 = love.graphics.newImage("images/fall_phase2_ans4.png")

	fallPhase2List = {fallPhase2ans1,fallPhase2ans2,fallPhase2ans3,fallPhase2ans4}
	exampleList = {fallPhase2List}

	quest_now_frame =  love.graphics.newQuad(0,0, 481, 121, 481, 121) --이 사이즈가 딱 맞음.
	answer_now_frame = love.graphics.newQuad(0,0, 40, 20, 40, 20) --정답 부분의 픽셀은 조금 늘려도 됨
end