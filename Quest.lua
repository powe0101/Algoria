--Quest.lua 및 관련 함수 추가. by.현식 0802

phase = 1 --표지판을 통한 퀘스트 단계. 다리가 3번 열려야 하니 페이즈는 총 3단계가 존재. by.현식 0802
multipleChoice = 1

answerList = {1,2,3,4,4,3,2,1}
--정답을 미리 정해놓고 이와 일치하는지 여부를 확인하기 위함.

function FallQuestAndAnswerLoad()
	fallPhase2Quest = love.graphics.newImage("images/fall_phase2_quest.png") --그림판으로 작업한 임시 문제
	fallPhase2ans1 = love.graphics.newImage("images/fall_phase2_ans1.png")
	fallPhase2ans2 = love.graphics.newImage("images/fall_phase2_ans2.png")
	fallPhase2ans3 = love.graphics.newImage("images/fall_phase2_ans3.png")
	fallPhase2ans4 = love.graphics.newImage("images/fall_phase2_ans4.png")

	quest_now_frame =  love.graphics.newQuad(0,0, 481, 121, 481, 121) --이 사이즈가 딱 맞음.
	answer_now_frame = love.graphics.newQuad(0,0, 40, 20, 40, 20)
end

function CheckQuest()
  -- body
  if love.keyboard.isDown('up') then
  	if stageLevel == 1 then
  		if 215 < pl:GetX() and pl:GetX() < 227 then --봄에서의 표지퐌 자표를 입력해주면 됨. by.현식 0803
      		questCheck = true
    	end
  	elseif stageLevel == 3 then --가을
    	if 290 < pl:GetX() and pl:GetX() < 330 then
      		questCheck = true
    	end
    end
  end
end

function DrawQuest()
	love.graphics.setColor(0,0,0,255) -- 검은색 RGBA
  	DrawRectangle(30, 5, 250, 85) --검은색 테두리
  	love.graphics.setColor(255,255,255,255)
  	love.graphics.rectangle("fill", 62, 12, 496, 166) --테두리 안에 흰색 도화지?

  	if phase == 2 then --가을, phase2의 문제 그리기.
  		love.graphics.draw(fallPhase2Quest,quest_now_frame,70,12) --테스트용
  	end

  	if phase == 1 then
  		DrawTip()
  	elseif phase ==2 then
  		DrawMultipleChoice()
  	end
  	-- 단순 엔터쳐서 넘어가는 문제도 있겠지만 난이도가 올라가면 이 부분에서도 4지선다로 문제를 풀 수 
  	-- 있도록 하고 팝업창이 위/아래로 넘기듯이 여기선 좌/우로 넘겨서 맞는 답이면 클리어와 동시에
  	-- 다리가 올라올수 있도록 하고 틀리면 라이프가 깍이고 창은 계속 떠있는 방식?으로 지금은 생각중.
  	-- 그러기 위해서는 라이프 개념도 구현해야 함. 또 동시에 세이브에 대한 필요성도 있음.
  	-- 각 스테이지와 페이즈를 가리키는 변수인 stageLevel과 phase를 이용해서 적절히 문제를 내면 될 듯.
  	-- 그렇게 하면 퀘스트는 5(파이널 스테이지, 보스 스테이지) x 3 정도에 여분의 문제까지 준비하면 될듯.
  	-- 문제는 이미지로 미리 준비해서 띄워주는 방식으로.
  	-- 내일 나머지 구현할 것. by. 현식 0802

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
	love.graphics.draw(fallPhase2ans1,answer_now_frame,100,150)
	love.graphics.draw(fallPhase2ans2,answer_now_frame,200,150)
	love.graphics.draw(fallPhase2ans3,answer_now_frame,300,150)
	love.graphics.draw(fallPhase2ans4,answer_now_frame,400,150)

	love.graphics.setColor(255,0,0,255)
	love.graphics.ellipse("line", 105, 159, 7, 7, 100) -- 정답을 체크하는 원 그리기

	love.graphics.setColor(255,255,255,255) -- 하얀색 RGBA로 마무리해야함.
	--[[ --Love를 직접 이용할 경우에는 이런식으로..
	love.graphics.setColor(255,0,0,255)
	love.graphics.print("① 마이충", 165, 150) -- 한글깨짐. 폰트추가해야됨.
	
	love.graphics.setColor(0,0,0,255)
	love.graphics.print("② 베인충", 215, 150)
	love.graphics.print("③ 티모충", 265, 150)
	love.graphics.print("④ 잭스충", 315, 150)
	]]--
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
	      		questCheck = false
	      		phase = phase + 1
	      		BridegePassValue = BridegePassValue + 40
	      	end
	    end

	    if love.keyboard.isDown("escape") then -- esc누르면 아무일도 일어나지 않고 퀘스트창이 닫힘.
	      questCheck = false
	    end
	end
end