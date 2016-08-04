-- 0804. 현식 추가. 정답과 관련된 리스트 및 이미지를 관리할 예정.

fadeTime = 0
fadeLight = 0
fadeOn = false
fadeOnRight = false
fadeOnWrong = false

function CheckFadeIn(dt) --main.lua의 update에서 계속 확인하고 있음.
	if fadeOn then
	   fadeTime = fadeTime + dt
	   fadeLight = 255 * math.sin(0.5 * fadeTime)
	   --lightup = 127 + (127 * math.sin(time_1))
	end
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

function AnsewerLoad()
	imgRightAnswer = love.graphics.newImage("images/rightAnswer(test).png")
	imgRightAnswer:setFilter("nearest","nearest")

	imgWrongAnswer = love.graphics.newImage("images/wrongAnswer(test).png")
	imgWrongAnswer:setFilter("nearest","nearest")

	rihgt_now_frame =  love.graphics.newQuad(0,0, 481, 121, 481, 121)
	wrong_now_frame =  love.graphics.newQuad(0,0, 481, 121, 481, 121)
end