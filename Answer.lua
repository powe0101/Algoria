-- 0804. 현식 추가. 정답과 관련된 리스트 및 이미지를 관리할 예정.

--정답을 미리 정해놓고 이와 일치하는지 여부를 확인하기 위함.
answerList = {1,2,3,4,4,3,2,1}

exampleList = {} --4지선다형을 담기 위한 리스트. 이건 리스트 안에 리스트를 넣어야 하나 ??
fallPhase2List = {}

--페이드인/아웃과 관련된 변수
fadeTime = 0
fadeLight = 0
fadeOn = false
fadeOnRight = false
fadeOnWrong = false

function CheckFadeIn(dt) --main.lua의 update에서 계속 확인하고 있음.
	if fadeOn then
	   fadeTime = fadeTime + dt
	   fadeLight = 255 * math.sin(1 * fadeTime)
	   --lightup = 127 + (127 * math.sin(time_1))
	end
end

function ControlFadeOut()
	if phase > 1 and love.keyboard.isDown("tab") then
	   	 --아무키나 누르시오를 구현하기 위함.
	else
	   	FadeOut() --오답일 경우 메시지가 뜨고난 다음, 그 메시지를 없애는 페이드아웃.
	end
end

function ControlFadeOutVerMouse()
	if fadeOn then
    	if love.mouse.isDown(1) or love.mouse.isDown(2) then
        	FadeOut() 
   	 	end
  	end 
end

function ActivateFadeOut()
	if fadeOn then --오답일 경우 오답이란 메시지를 페이드인으로 띄워줌.
  		if fadeOnRight then --정답일 때도 만들수 있는데 구현은 안함. 딱히 필요 없을듯. by.0804 현식.
	  		love.graphics.setColor(255, 255, 255, fadeLight)
			love.graphics.draw(imgRightAnswer, wrong_now_frame, 50,50) --정답은 안쓰임
		elseif fadeOnWrong then --오답일 때 오답이라고 창 뜨는 것 외에도 라이프가 깍이면 좋겠음.
	  		love.graphics.setColor(255,255,255, fadeLight)
			love.graphics.draw(imgWrongAnswer, wrong_now_frame, 130,25)
		end
	end	
	ResetColor()
end

function TurnOnFadeOut()
	fadeOn = true
	fadeOnWrong = true
end

function FadeOut() --Quest.lua에서 정답/오답일 경우에 사용됨.
	if fadeOn then
   		fadeOn = false
   		fadeTime = 0
		fadeLight = 0
		fadeOnRight = false
		fadeOnWrong = false
	end
end

function FadeLoad()
	imgRightAnswer = love.graphics.newImage("images/rightAnswer(test).png")
	imgRightAnswer:setFilter("nearest","nearest")

	imgWrongAnswer = love.graphics.newImage("images/wrongAnswer.png")
	imgWrongAnswer:setFilter("nearest","nearest")

	rihgt_now_frame =  love.graphics.newQuad(0,0, 207, 141, 207, 141)
	wrong_now_frame =  love.graphics.newQuad(0,0, 386, 141, 386, 141)
end

function AnswerLoad()
	SpringAnswerLoad()
	SummerAnswerLoad()
	FallAnswerLoad()
	WinterAnswerLoad()

	exampleList = {springPhase2List, springPhase3List, summerPhase2List, summerPhase3List,
				   fallPhase2List, fallPhase3List, winterPhase2List, winterPhase3List}

	answer_now_frame = love.graphics.newQuad(0,0, 80, 30, 80, 30) --정답 부분의 픽셀은 조금 늘려도 됨
end

function SpringAnswerLoad()
	springPhase2ans1 = love.graphics.newImage("images/quest/answer/spring_phase2_ans1.png")
	springPhase2ans2 = love.graphics.newImage("images/quest/answer/spring_phase2_ans2.png")
	springPhase2ans3 = love.graphics.newImage("images/quest/answer/spring_phase2_ans3.png")
	springPhase2ans4 = love.graphics.newImage("images/quest/answer/spring_phase2_ans4.png")

	springPhase3ans1 = love.graphics.newImage("images/quest/answer/spring_phase3_ans1.png")
	springPhase3ans2 = love.graphics.newImage("images/quest/answer/spring_phase3_ans2.png")
	springPhase3ans3 = love.graphics.newImage("images/quest/answer/spring_phase3_ans3.png")
	springPhase3ans4 = love.graphics.newImage("images/quest/answer/spring_phase3_ans4.png")

	springPhase2List = {springPhase2ans1,springPhase2ans2,springPhase2ans3,springPhase2ans4}
	springPhase3List = {springPhase3ans1,springPhase3ans2,springPhase3ans3,springPhase3ans4}
end

function SummerAnswerLoad()
	summerPhase2ans1 = love.graphics.newImage("images/quest/answer/summer_phase2_ans1.png")
	summerPhase2ans2 = love.graphics.newImage("images/quest/answer/summer_phase2_ans2.png")
	summerPhase2ans3 = love.graphics.newImage("images/quest/answer/summer_phase2_ans3.png")
	summerPhase2ans4 = love.graphics.newImage("images/quest/answer/summer_phase2_ans4.png")

	summerPhase3ans1 = love.graphics.newImage("images/quest/answer/summer_phase3_ans1.png")
	summerPhase3ans2 = love.graphics.newImage("images/quest/answer/summer_phase3_ans2.png")
	summerPhase3ans3 = love.graphics.newImage("images/quest/answer/summer_phase3_ans3.png")
	summerPhase3ans4 = love.graphics.newImage("images/quest/answer/summer_phase3_ans4.png")

	summerPhase2List = {summerPhase2ans1,summerPhase2ans2,summerPhase2ans3,summerPhase2ans4}
	summerPhase3List = {summerPhase3ans1,summerPhase3ans2,summerPhase3ans3,summerPhase3ans4}
end

function FallAnswerLoad()
	fallPhase2ans1 = love.graphics.newImage("images/quest/answer/fall_phase2_ans1.png")
	fallPhase2ans2 = love.graphics.newImage("images/quest/answer/fall_phase2_ans2.png")
	fallPhase2ans3 = love.graphics.newImage("images/quest/answer/fall_phase2_ans3.png")
	fallPhase2ans4 = love.graphics.newImage("images/quest/answer/fall_phase2_ans4.png")

	fallPhase3ans1 = love.graphics.newImage("images/quest/answer/fall_phase3_ans1.png")
	fallPhase3ans2 = love.graphics.newImage("images/quest/answer/fall_phase3_ans2.png")
	fallPhase3ans3 = love.graphics.newImage("images/quest/answer/fall_phase3_ans3.png")
	fallPhase3ans4 = love.graphics.newImage("images/quest/answer/fall_phase3_ans4.png")

	fallPhase2List = {fallPhase2ans1,fallPhase2ans2,fallPhase2ans3,fallPhase2ans4}
	fallPhase3List = {fallPhase3ans1,fallPhase3ans2,fallPhase3ans3,fallPhase3ans4}
end

function WinterAnswerLoad()
	winterPhase2ans1 = love.graphics.newImage("images/quest/answer/winter_phase2_ans1.png")
	winterPhase2ans2 = love.graphics.newImage("images/quest/answer/winter_phase2_ans2.png")
	winterPhase2ans3 = love.graphics.newImage("images/quest/answer/winter_phase2_ans3.png")
	winterPhase2ans4 = love.graphics.newImage("images/quest/answer/winter_phase2_ans4.png")

	winterPhase3ans1 = love.graphics.newImage("images/quest/answer/winter_phase3_ans1.png")
	winterPhase3ans2 = love.graphics.newImage("images/quest/answer/winter_phase3_ans2.png")
	winterPhase3ans3 = love.graphics.newImage("images/quest/answer/winter_phase3_ans3.png")
	winterPhase3ans4 = love.graphics.newImage("images/quest/answer/winter_phase3_ans4.png")

	winterPhase2List = {winterPhase2ans1,winterPhase2ans2,winterPhase2ans3,winterPhase2ans4}
	winterPhase3List = {winterPhase3ans1,winterPhase3ans2,winterPhase3ans3,winterPhase3ans4}
end

function GetAnswerNum()
	if stageLevel == 1 then
		return phase + stageLevel - 2
	elseif stageLevel == 2 then
		return phase + stageLevel - 1
	elseif stageLevel == 3 then
		return phase + stageLevel
	elseif stageLevel == 4 then
		return phase + stageLevel + 1
	end
end